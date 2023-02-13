{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule {
  pname = "chyle";
  version = "unstable-2022-05-06";

  src = fetchFromGitHub {
    owner = "antham";
    repo = "chyle";
    rev = "28089c39b9277d9915cfe2e2968b272768063fb2"; # tags/*
    sha256 = "1flrlz6djf9ad445k3q7h2isrkb2wbbspl4pi4fpsq26qil28ni5";
  };

  vendorSha256 = "sha256-+HE5cQYJ0QrMxcOeBJZVAqtTwMBSt0dgo5kqg8IOngk=";

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/antham/chyle";
    description = "Changelog generator : use a git repository and various data sources and publish the result on external services";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
