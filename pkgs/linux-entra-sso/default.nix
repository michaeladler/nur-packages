{
  stdenv,
  lib,
  fetchFromGitHub,
  fetchurl,
  python3,
  glib,
  makeWrapper,
  jq,
  nix-update-script,
}:

let
  myPythonEnv = python3.withPackages (
    ps: with ps; [
      pydbus
    ]
  );

in

stdenv.mkDerivation (finalAttrs: {
  pname = "linux-entra-sso";
  version = "1.10.2";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "24eaf809cfeaf1269efbaa8c038b3431f4d9fb30";
    sha256 = "sha256-NgJIgPDq8SzXlodlkyxKRrFB0z3lDsp9TOUPmoNua2I=";
  };

  xpiSrc = fetchurl {
    url = "https://github.com/siemens/linux-entra-sso/releases/download/v${finalAttrs.version}/linux_entra_sso-${finalAttrs.version}.xpi";
    hash = "sha256-VSeNGqlNcHisEm/33fQalxTCZKuVgU2fppYdCk1n1R8=";
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

    mkdir -p $out/share/mozilla/extensions
    cp ${finalAttrs.xpiSrc} $out/share/mozilla/extensions/linux-entra-sso@example.com.xpi
  '';

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=stable"
      "--custom-dep"
      "xpiSrc"
    ];
  };

  meta = with lib; {
    homepage = "https://github.com/siemens/linux-entra-sso";
    description = "Browser plugin for Linux to SSO on Microsoft Entra ID using a locally running microsoft identity broker (Intune)";
    maintainers = [ maintainers.michaeladler ];
    platforms = platforms.linux;
    license = licenses.mpl20;
  };
})
