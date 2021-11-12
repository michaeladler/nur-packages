final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-12";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "e3eae23e5aa2aa818ff7662f535bf6e1d5b0fd3e";
    sha256 = "1mgjlmp2gjm8ddn3rwm47mh00mpdmll68b8xk21mdq4f8ig4pf5c";
  };

})
