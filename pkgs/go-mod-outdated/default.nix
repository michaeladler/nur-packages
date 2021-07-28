{ lib, fetchFromGitHub, buildGoModule, i3status }:

buildGoModule {
  pname = "go-mod-outdated";
  version = "unstable-2021-07-12";

  src = fetchFromGitHub {
    owner = "psampaz";
    repo = "go-mod-outdated";
    rev = "b269a0d1b2c1a0ed3f3757bdb05b43f629f86c48";
    sha256 = "02rq099n8i53xp47wb8an5y62xlgxy2q5z2wsw2pnnrlzfpq9wdw";
  };

  vendorSha256 = "sha256-Ue0jCGOG2Fmaz2F9+xl3oYAZCyHFBuEleqjmk6dDjoM=";

  meta = with lib; {
    description = "Find outdated dependencies of your Go projects";
    homepage = "https://github.com/psampaz/go-mod-outdated";
    license = licenses.mit;
  };
}
