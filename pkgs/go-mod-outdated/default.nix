{
  lib,
  fetchFromGitHub,
  buildGoModule,
}:

buildGoModule {
  pname = "go-mod-outdated";
  version = "0.9.0-unstable-2023-02-19";

  src = fetchFromGitHub {
    owner = "psampaz";
    repo = "go-mod-outdated";
    rev = "bb79367d102a05221196613dde574f1a0b81b556";
    sha256 = "0jxbx200p3pih510gvvmkj0c68giaxqsgqy9k7qybbxskxy7nzwl";
  };

  vendorHash = "sha256-SAFXivHCBFB9aKKyPwk3YRQY6IrPBls5HtK/20kPV0o=";

  meta = with lib; {
    description = "Find outdated dependencies of your Go projects";
    homepage = "https://github.com/psampaz/go-mod-outdated";
    license = licenses.mit;
  };
}
