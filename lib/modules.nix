{ self, lib, ... }:

let
  inherit (builtins)
    attrValues
    readDir
    pathExists
    concatLists
    ;
  inherit (lib)
    id
    mapAttrsToList
    filterAttrs
    hasPrefix
    hasSuffix
    nameValuePair
    removeSuffix
    ;
  inherit (self.attrs) mapFilterAttrs;
in
rec {
  # Traverses a directory and applies a function to each Nix module file or subdirectory with a default.nix.
  # Arguments:
  #   dir: Path to the directory to traverse.
  #   fn: Function to apply to each module path.
  # Returns: An attribute set mapping module names to the result of `fn`.
  mapModules =
    dir: fn:
    mapFilterAttrs (n: v: v != null && !(hasPrefix "_" n)) (
      n: v:
      let
        path = "${toString dir}/${n}";
      in
      if v == "directory" && pathExists "${path}/default.nix" then
        nameValuePair n (fn path)
      else if v == "regular" && n != "default.nix" && hasSuffix ".nix" n then
        nameValuePair (removeSuffix ".nix" n) (fn path)
      else
        nameValuePair "" null
    ) (readDir dir);

  # Like mapModules, but returns a list of the results instead of an attribute set.
  mapModules' = dir: fn: attrValues (mapModules dir fn);

  # Recursively traverses a directory, applying a function to each Nix module file or subdirectory.
  # Arguments:
  #   dir: Path to the directory to traverse.
  #   fn: Function to apply to each module path.
  # Returns: An attribute set mapping module names to the result of `fn` or nested attribute sets for subdirectories.
  mapModulesRec =
    dir: fn:
    mapFilterAttrs (n: v: v != null && !(hasPrefix "_" n)) (
      n: v:
      let
        path = "${toString dir}/${n}";
      in
      if v == "directory" then
        nameValuePair n (mapModulesRec path fn)
      else if v == "regular" && n != "default.nix" && hasSuffix ".nix" n then
        nameValuePair (removeSuffix ".nix" n) (fn path)
      else
        nameValuePair "" null
    ) (readDir dir);

  # Like mapModulesRec, but returns a list of the results instead of an attribute set.
  mapModulesRec' =
    dir: fn:
    let
      dirs = mapAttrsToList (k: _: "${dir}/${k}") (
        filterAttrs (n: v: v == "directory" && !(hasPrefix "_" n)) (readDir dir)
      );
      files = attrValues (mapModules dir id);
      paths = files ++ concatLists (map (d: mapModulesRec' d id) dirs);
    in
    map fn paths;

}
