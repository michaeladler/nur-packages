{ src, stdenvNoCC, fetchFromGitHub, zig, extraConfig ? { } }:

# https://github.com/zigtools/zls/blob/master/default.nix
stdenvNoCC.mkDerivation {
  inherit src;

  name = "zls";
  version = toString src.lastModifiedDate;

  nativeBuildInputs = [ zig ];
  dontConfigure = true;
  dontInstall = true;
  buildPhase = ''
    mkdir -p $out
    zig build install -Drelease-safe=true -Ddata_version=master --prefix $out
    cat << EOF > $out/bin/zls.json
      ${
        builtins.toJSON ({
          zig_lib_path = "${zig}/lib/zig/";
          zig_exe_path = "${zig}/bin/zig";
          warn_style = false;
          enable_snippets = false;
          enable_semantic_tokens = false;
          operator_completions = true;
        } // extraConfig)
      }
    EOF
  '';
  XDG_CACHE_HOME = ".cache";
}
