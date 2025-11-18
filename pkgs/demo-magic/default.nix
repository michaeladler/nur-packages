{
  stdenv,
  lib,
  fetchFromGitHub,
  writeShellApplication,
  pv,
}:

stdenv.mkDerivation rec {
  pname = "demo-magic";
  version = "unstable-2025-04-29";

  src = fetchFromGitHub {
    owner = "paxtonhare";
    repo = "demo-magic";
    rev = "2a2f439c26a93286dc2adc6ef2a81755af83f36e";
    sha256 = "1f7g5gn76vbpsns0j4jn0ijc5zgfdh15ja4gcg8k62wkaxbvn3ng";
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
