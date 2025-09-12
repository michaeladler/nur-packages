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
  version = "unstable-2025-09-11";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "dfad03505f8f48e83bb8facf7a8bb9939adcd5e7";
    sha256 = "1xj6hkanwi9z9k2ccqd5vxzy7kb9l7i7jr90bdl24n2z4db3zgv4";
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
