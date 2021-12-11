final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-11";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "e875321497565f0b5b212c07377ce8bbbaf64944";
    sha256 = "1apmd8vn4pbs0qs4lc1m86z99qzyd6ix6xkvvga4i7wnw40hrlf3";
  };

})
