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
  version = "unstable-2026-02-17";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "1740524e18135c81f03883078e87a849d3e86322";
    sha256 = "1hs5vpi8yjhi3hkqxcfyyvqigljdr2nsm25r0amrz3jhq3qcfsvb";
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
