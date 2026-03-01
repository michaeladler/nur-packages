{
  stdenv,
  lib,
  fetchFromGitHub,
  python3,
  glib,
  makeWrapper,
  jq,
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

  nativeBuildInputs = [
    makeWrapper
    jq
  ];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp linux-entra-sso.py $out/bin/.linux-entra-sso.py-wrapped

    mkdir -p $out/lib/mozilla/native-messaging-hosts
    jq ".path = \"$out/bin/linux-entra-sso\"" \
        platform/firefox/linux_entra_sso.json \
        >$out/lib/mozilla/native-messaging-hosts/linux_entra_sso.json

    mkdir -p $out/etc/chromium/native-messaging-hosts
    jq ".path = \"$out/bin/linux-entra-sso\"" \
        platform/chrome/linux_entra_sso.json |
        sed '/{extension_id}/d' >$out/etc/chromium/native-messaging-hosts/linux_entra_sso.json

    makeWrapper ${myPythonEnv}/bin/python $out/bin/linux-entra-sso \
      --add-flags "$out/bin/.linux-entra-sso.py-wrapped" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ glib ]}"
  '';

  meta = with lib; {
    homepage = "https://github.com/siemens/linux-entra-sso";
    description = "Browser plugin for Linux to SSO on Microsoft Entra ID using a locally running microsoft identity broker (Intune)";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.linux;
    license = licenses.mpl20;
  };
}
