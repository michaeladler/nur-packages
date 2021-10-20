final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-10-19";

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "6713fb679a827ac6d382085e6dd9c98a414d490c";
    sha256 = "0232n82rhl35n41bdwrmfis6kiqd1mhasb050sh535a0dz7kar65";
  };

})
