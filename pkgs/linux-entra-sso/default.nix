{
  stdenv,
  lib,
  fetchFromGitHub,
  python3,
  glib,
  makeWrapper,
}:

let
  myPythonEnv = python3.withPackages (
    ps: with ps; [
      pydbus
    ]
  );

in

stdenv.mkDerivation {
  pname = "linux-entra-sso";
  version = "unstable-2026-02-17";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "1740524e18135c81f03883078e87a849d3e86322";
    sha256 = "1hs5vpi8yjhi3hkqxcfyyvqigljdr2nsm25r0amrz3jhq3qcfsvb";
  };

  buildInputs = [ glib ];

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp linux-entra-sso.py $out/bin/.linux-entra-sso.py-wrapped

    makeWrapper ${myPythonEnv}/bin/python $out/bin/linux-entra-sso \
      --add-flags "$out/bin/.linux-entra-sso.py-wrapped" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ glib ]}"
  '';

  meta = with lib; {
    homepage = "https://github.com/siemens/linux-entra-sso";
    description = "A simple CLI tool to interact with a Microsoft Identity Broker";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.linux;
    license = licenses.mpl20;
  };
}
