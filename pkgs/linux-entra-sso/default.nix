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
  version = "unstable-2026-07-10";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "b52ef2afd5cffbbdaeb81dba78a9c68a3fff2328";
    sha256 = "0m7jwv0b7fy6v2bffy2glyxvwyyys8g5jr130hv48ssnm0sm5334";
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
