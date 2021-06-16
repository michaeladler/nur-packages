{ stdenvNoCC, fetchFromGitHub, zig, extraConfig ? { } }:

# https://github.com/zigtools/zls/blob/master/default.nix
stdenvNoCC.mkDerivation {
  name = "zls";
  version = "2021-06-16";

  src = fetchFromGitHub {
    owner = "zigtools";
    repo = "zls";
    rev = "fdb5e8f9fb5f7304e50c08a97275064d2053a9a2";
    sha256 = "066jk72rd063ik5cj7sarijwgz5pyj6v6cmsj8mhb1arsq94mbjd";
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
