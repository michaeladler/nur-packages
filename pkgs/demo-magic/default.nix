{ stdenv, lib, fetchFromGitHub, writeShellApplication, pv }:

stdenv.mkDerivation rec {
  pname = "demo-magic";
  version = "unstable-2024-05-28";

  src = fetchFromGitHub {
    owner = "paxtonhare";
    repo = "demo-magic";
    rev = "8f338e9771502f71a77d6c779aed2dae614fdb0d";
    sha256 = "10pv3370gkkkj6zils6rg1gwfdg8psz56654z08z72qgkyag52k5";
  };

  installPhase =
    let
      wrapper = writeShellApplication {
        name = "demo-magic.sh";
        runtimeInputs = [ pv ];
        text = ''
          # marker
        '';
      };
    in
    ''
      install -D -m 0644 ${src}/demo-magic.sh $out/share/demo-magic.sh
      install -D -m0755 ${wrapper}/bin/demo-magic.sh $out/bin/demo-magic.sh
    '';

  postFixup = ''
    echo "source $out/share/demo-magic.sh" >> $out/bin/demo-magic.sh
  '';

  meta = with lib; {
    homepage = "https://github.com/paxtonhare/demo-magic/";
    description = "A handy shell script that enables you to write repeatable demos in a bash environment.";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.all;
    license = licenses.mit;
  };
}
