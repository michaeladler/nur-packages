final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-03-04";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "c6e293cbc57787b01c338ce2e54f76c68f3ea593";
    sha256 = "1gp7cmd9rf5gab2jv199d1gb0119c3b172sgqspk18fg51yfnz9b";
  };

})
