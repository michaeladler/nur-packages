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
  version = "unstable-2025-05-26";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "a8b4526271a188409dec8cb2a456a17b3a67d7c1";
    sha256 = "0y4ldmps2wqvj7giys3l8afwa81wz61891hf09v9myx7c27lagkr";
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
