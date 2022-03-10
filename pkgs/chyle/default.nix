{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  name = "chyle";
  version = "unstable-2021-12-15";

  src = fetchFromGitHub {
    owner = "antham";
    repo = "chyle";
    rev = "219c158bb41f756149f1e8aa7be9c794e7e93646"; # tags/*
    sha256 = "0pzirmshhya16slynff88hjbwpcx4xz7nxknrfa7mp6sr9ghia9z";
  };

  vendorSha256 = "sha256-egKcho1+rm5PNpOwQOpRs4DS4953tX5/pfKt0w/2P+s=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/antham/chyle";
    description = "Changelog generator : use a git repository and various data sources and publish the result on external services";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
