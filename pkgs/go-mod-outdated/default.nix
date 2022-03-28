{ lib, fetchFromGitHub, buildGoModule, i3status }:

buildGoModule {
  pname = "go-mod-outdated";
  version = "unstable-2022-03-27";

  src = fetchFromGitHub {
    owner = "psampaz";
    repo = "go-mod-outdated";
    rev = "6cfde1dc899c85a71d3806f661529f5291f9b96a";
    sha256 = "1jbnnbbpfv92q90xkhzqc7y1b074qipxwblz11phwjbbbq09nwws";
  };

  vendorSha256 = "sha256-nkjIwzT9JblKzWKOBFW+uYYbJulN6n6Fp+WH/8pEQK8=";

  meta = with lib; {
    description = "Find outdated dependencies of your Go projects";
    homepage = "https://github.com/psampaz/go-mod-outdated";
    license = licenses.mit;
  };
}
