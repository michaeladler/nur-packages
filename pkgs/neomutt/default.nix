final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-11";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "5436a963861198073b9451d830f2a9eb31d51939";
    sha256 = "11wfasqnxkm82pvwwdygjls4dpvff6246w2w142r0zb1j8nny7mm";
  };

})
