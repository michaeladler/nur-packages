final: prev:

prev.handlr.overrideAttrs (old: {

  version = "unstable-2021-08-28";
  src = prev.fetchFromGitHub {
    owner = "chmln";
    repo = "handlr";
    rev = "90e78ba92d0355cb523abf268858f3123fd81238";
    sha256 = "0av3fvfkn7f15cq8raiybin5z3a0bjnjk35wmwzxhz3h82an2hy0";
  };

})
