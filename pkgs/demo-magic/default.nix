{ stdenv, lib, fetchFromGitHub, writeShellApplication, pv }:

stdenv.mkDerivation rec {
  pname = "demo-magic";
  version = "unstable-2022-11-05";

  src = fetchFromGitHub {
    owner = "paxtonhare";
    repo = "demo-magic";
    rev = "a938137035b73105d09347a91f9fd5e9722b617a";
    sha256 = "07xl9ksxx408sk1ljba5qhwx3p3b5264m4p3khhd06mrqn1ajw4f";
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
