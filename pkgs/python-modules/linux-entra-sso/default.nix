{ lib
, fetchFromGitHub
, buildPythonPackage
, python3Packages
, zip
, git
, which
, ...
}:

buildPythonPackage {
  pname = "linux-entra-sso";
  version = "unstable-2025-08-16";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "7adb41d2fdc744d2c52708d91817f65e47ad9682";
    sha256 = "0ywr9g8fhzc58wl18cbpcr2yy40fahs84ssc4ndk0x2yz39gh7bd";
  };

  nativeBuildInputs = [ zip git which ];

  dependencies = with python3Packages; [
    pydbus
    pygobject3
  ];

  propagatedBuildInputs = with python3Packages; [
    pydbus
    pygobject3
  ];

  doCheck = false;

  pyproject = false;

  makeFlags = [
    "DESTDIR=$(out)"
    "prefix="
  ];

  meta = with lib; {
    description = "Browser plugin for Linux to SSO on Microsoft Entra ID using a locally running microsoft identity broker (Intune).";
    homepage = "https://github.com/siemens/linux-entra-sso";
    license = licenses.mpl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
