final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-26";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "72ebdb4600cbdc5ad83c22e87347411e9adcac73";
    sha256 = "0c2ck5rxcbcxa9dv14r0w7mryrff7k9dcfnlm9fbhmg10xs17z56";
  };

})
