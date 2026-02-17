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
  version = "unstable-2026-02-16";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "4e5a1d7a652b753f25f7a9c25833a7301250561b";
    sha256 = "1m43vfq2bgivgmsy05m5aj4qv035ixc2y1w5bjifab6cg9ng177i";
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
