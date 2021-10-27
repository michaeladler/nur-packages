final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-10-26";

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "2c6998b91640bb75c4b527d58b4bd00e42eeaf15";
    sha256 = "02z9gj802h5ga168lzj5lb78w9jq15qwiji15g5s8b75xp76d52m";
  };

})
