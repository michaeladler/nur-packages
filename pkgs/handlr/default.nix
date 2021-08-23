final: prev:

prev.handlr.overrideAttrs (old: {

  version = "unstable-2021-07-30";
  src = prev.fetchFromGitHub {
    owner = "chmln";
    repo = "handlr";
    rev = "b9b71369f855eb48f4ecca051515feb05d68f87d";
    sha256 = "0kkgjzxrny7vhv7xhglr4m2k69yq2salvjfiqxgqkjiczbrsr95l";
  };

})
