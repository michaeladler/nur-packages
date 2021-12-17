final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-17";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "61f9bd7c250f2bfcbb3cb67c33effa1d61638c87";
    sha256 = "1brpc646948rapd5nzmj36m2lbfaj448acywc2mqc7vj93vqwpza";
  };

})
