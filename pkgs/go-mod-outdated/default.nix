{ lib, fetchFromGitHub, buildGoModule, i3status }:

buildGoModule {
  pname = "go-mod-outdated";
  version = "unstable-2021-10-11";

  src = fetchFromGitHub {
    owner = "psampaz";
    repo = "go-mod-outdated";
    rev = "0db5223616ecf1828b7aeaf8da331a27539bfbbd";
    sha256 = "0vskpsi6rkf8iiypryi9acmprrh9bfll9dhf54gw9b0n851ahzlr";
  };

  vendorSha256 = "sha256-Ue0jCGOG2Fmaz2F9+xl3oYAZCyHFBuEleqjmk6dDjoM=";

  meta = with lib; {
    description = "Find outdated dependencies of your Go projects";
    homepage = "https://github.com/psampaz/go-mod-outdated";
    license = licenses.mit;
  };
}
