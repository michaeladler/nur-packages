{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  python3Packages,
  zip,
  git,
  which,
  ...
}:

buildPythonPackage {
  pname = "linux-entra-sso";
  version = "unstable-2026-01-05";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "7c36bf8b3efcf5b666bd476b51bbcb5d32abb8a0";
    sha256 = "0b1cfadx5q0mnv2sadb26falida3yj9dlan9afgzdl83yia0ixnf";
  };

  nativeBuildInputs = [
    zip
    git
    which
  ];

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
