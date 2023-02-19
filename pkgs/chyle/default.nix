{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  pname = "chyle";
  version = "unstable-2023-01-24";

  src = fetchFromGitHub {
    owner = "antham";
    repo = "chyle";
    rev = "a5a93845007270e7d8011863fde68b97d76c3d88"; # tags/*
    sha256 = "0ayyz7dy5h3i3sl765g9k5h1a4lb5912sc117nv79lvw7if09h0d";
  };

  vendorSha256 = "sha256-+xJ9H+/RS/h7h8KBz1fz06n6XBizRJdUfTm3Ln+0JtE=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/antham/chyle";
    description = "Changelog generator : use a git repository and various data sources and publish the result on external services";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
