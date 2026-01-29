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
  version = "unstable-2026-01-28";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "linux-entra-sso";
    rev = "e1e04ffd8cd6a4a75667c822fd093255bc9c87b1";
    sha256 = "0ksszndwr9h2pncjw4kzl60665s2whnnc4pcawmlkq6d1q0fq7a7";
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
