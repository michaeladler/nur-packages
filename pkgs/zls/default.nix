{ src, stdenvNoCC, fetchFromGitHub, zig, extraConfig ? { } }:

# https://github.com/zigtools/zls/blob/master/default.nix
stdenvNoCC.mkDerivation {
  name = "zls";
  version = "2021-06-06";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "39d87188647bd8c8eed304ee18f2dd1df6942f60";
    sha256 = "07m4s4b63lyjbxkmby4zy7cy9z2cdlw8m0145x7gv40mrg9pjqyv";
    fetchSubmodules = true;
  };

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
