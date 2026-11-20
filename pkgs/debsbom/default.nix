{
  lib,
  fetchPypi,
  nix-update-script,
  python3Packages,
}:

python3Packages.buildPythonApplication rec {
  pname = "debsbom";
  version = "0.10.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5zFEfYqIEIsbu6Jg9ayJF2fCtxNUTik2xyS1wG/MvQ8=";
  };

  build-system = [ python3Packages.setuptools ];

  dependencies = with python3Packages; [
    packageurl-python
    python-debian
    license-expression
    cyclonedx-python-lib
    spdx-tools
    networkx
    requests
    zstandard
  ];

  pythonImportsCheck = [ "debsbom" ];

  passthru.updateScript = nix-update-script { extraArgs = [ "--flake" ]; };

  meta = {
    description = "Generate SBOMs for Debian-based distributions";
    homepage = "https://github.com/siemens/debsbom";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ michaeladler ];
    mainProgram = "debsbom";
  };
}
