{ lib, fetchFromGitHub, buildGoModule, i3status }:

buildGoModule {
  pname = "go-mod-outdated";
  version = "unstable-2022-01-14";

  src = fetchFromGitHub {
    owner = "psampaz";
    repo = "go-mod-outdated";
    rev = "0e5b58226df95a670bb0b404eb675916c1d7b846";
    sha256 = "1zg5m6s1da2g7skb48yalih275vq6szmq1lb4p0wkgf1i96ajgqg";
  };

  vendorSha256 = "sha256-Ue0jCGOG2Fmaz2F9+xl3oYAZCyHFBuEleqjmk6dDjoM=";

  meta = with lib; {
    description = "Find outdated dependencies of your Go projects";
    homepage = "https://github.com/psampaz/go-mod-outdated";
    license = licenses.mit;
  };
}
