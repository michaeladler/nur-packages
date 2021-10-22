final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-10-22";

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "20d1da5a106e423ad50ec881b908202e26e9a02e";
    sha256 = "0p67vjahmcm79ljzbgqdm0rc9fhdld9wnmdm3w10w13l3g95is2v";
  };

})
