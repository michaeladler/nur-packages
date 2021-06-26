{ lib, fetchFromGitHub, mkYarnPackage }:

mkYarnPackage {
  pname = "crx3";
  version = "2021-05-12";

  src = fetchFromGitHub {
    owner = "ahwayakchih";
    repo = "crx3";
    rev = "28883d7916f5f1826c9240d7c04f201debd804ca";
    sha256 = "07msq5a9vsrkcay5caj4hcxz854d05m0sj489gbm538102w23d94";
  };

  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;
  yarnNix = ./yarn.nix;

  meta = with lib; {
    description = "Create CRX3 files (web extension package v3 format) for Chromium, Google Chrome and Opera browsers.";
    homepage = "https://github.com/ahwayakchih/crx3";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
