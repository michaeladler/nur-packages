final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-12";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "f4932ef21e8004e01542dd344417a88724c0383d";
    sha256 = "1sin81am5bpyb7mybk4jlq8fqq9hs4xv46qis8vjqzxdp0n0dip0";
  };

})
