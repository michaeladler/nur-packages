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
  version = "unstable-2026-02-02";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "87279a47d13db957974ef122fdbe072f7a121a33";
    sha256 = "1a6qrmy1bvh9y7mj0bsdnfdnlxk55kxr1bvmvfl97m76z00glqcz";
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
