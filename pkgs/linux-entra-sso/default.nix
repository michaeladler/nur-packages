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
  version = "unstable-2026-07-02";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "9a39eab4853d1d1173145a90a7b4cbbba3cacd2e";
    sha256 = "1df42i3xm614wf6q0csnv5ik6c1xfm47cvm95pqlkxyacpknywn7";
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
