final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-07";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "22d9545a9d04286ced90dc07a74bddb98366fd8d";
    sha256 = "0ps2rff0a0w20h0diz0najls1h9xcd7llj6kpjyahngffb8y2jqf";
  };

})
