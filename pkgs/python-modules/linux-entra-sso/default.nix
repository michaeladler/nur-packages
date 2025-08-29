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
  version = "unstable-2025-08-28";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "1d0ff3311d16d7ffbec2b7d0a474752b8cb2c54e";
    sha256 = "09lxbbsb5f7n7q0ln5si9zcr86hmcm6yb35vjxyyq75q5629pnh1";
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
