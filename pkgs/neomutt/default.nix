final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-10-21";

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "7a41cd9370b0afd9653934a4c73d4da3fd85332d";
    sha256 = "03818iq0gw87zxlqry9l9aymhl6firakwfqhacz6zykz8mfggl6d";
  };

})
