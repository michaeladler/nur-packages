{
  stdenv,
  lib,
  fetchFromGitHub,
  writeShellApplication,
  pv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "demo-magic";
  version = "0-unstable-2026-09-17";

  src = fetchFromGitHub {
    owner = "paxtonhare";
    repo = "demo-magic";
    rev = "142f0e70c6242456f166aaa75dd3de829ab7fe73";
    sha256 = "sha256-mFsEDQLXJTIJq6XwHqrsAmPTGHXMrMBu1Ecr+HmYyNQ=";
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
      install -D -m 0644 ${finalAttrs.src}/demo-magic.sh $out/share/demo-magic.sh
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
})
