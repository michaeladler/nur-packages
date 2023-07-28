let
  flake = builtins.getFlake (toString ./.);
  flake-utils = flake.inputs.flake-utils.lib;

  pkgs = flake.legacyPackages.x86_64-linux.zenPackages;
in

flake-utils.flattenTree (
  pkgs.kernel //
  pkgs.nvidiaPackages.latest.open //
  pkgs.turbostat
)
