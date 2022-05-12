{ lib, fetchFromGitHub, buildGoModule, i3status }:

buildGoModule {
  pname = "go-mod-outdated";
  version = "unstable-2022-05-09";

  src = fetchFromGitHub {
    owner = "psampaz";
    repo = "go-mod-outdated";
    rev = "32fc7a3d5dfe9f8f2b631447313bcb79830858be";
    sha256 = "0c945qzbqv56i0lsvcxwic1wg9xgb87k2pjwyzhwcdvx3kgjrzk0";
  };

  vendorSha256 = "sha256-nkjIwzT9JblKzWKOBFW+uYYbJulN6n6Fp+WH/8pEQK8=";

  meta = with lib; {
    description = "Find outdated dependencies of your Go projects";
    homepage = "https://github.com/psampaz/go-mod-outdated";
    license = licenses.mit;
  };
}
