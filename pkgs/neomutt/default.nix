final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-17";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "f3b9af50105daaa18563e929d4d39bd7a88de372";
    sha256 = "0rqnk1q4hw8ahwkpdvwy38kak8hh8lr7396hqn2dmxv8n5w2jim6";
  };

})
