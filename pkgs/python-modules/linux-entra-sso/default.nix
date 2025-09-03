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
  version = "unstable-2025-09-02";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "8c63e04433448029cf089069baad232167faba7a";
    sha256 = "0k0766jksfvnlflvq56d2xx3qls0fjii1104hq49npij6iaq4chr";
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
