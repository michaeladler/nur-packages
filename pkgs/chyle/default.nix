{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  pname = "chyle";
  version = "unstable-2024-05-03";

  src = fetchFromGitHub {
    owner = "antham";
    repo = "chyle";
    rev = "c8116573d89a2e2b8401aede366571731b329863"; # tags/*
    sha256 = "0hplknkz7k94a9w90p57rkhy6k0zp85vifd5p5cqnljpv6rc6nd0";
  };

  vendorHash = "sha256-zz7Gg3bZG24uyx7Ly42FhihE7KpWK0B9wnM/Ni+A+30=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/antham/chyle";
    description = "Changelog generator : use a git repository and various data sources and publish the result on external services";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
