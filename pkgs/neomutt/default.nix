final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-09";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "f17a0332c509e8039d749997836e26ab0512d118";
    sha256 = "0bd2q3qlmqadg8fwlzfnigfqjd2j4bld8vxf98j1x66lfg6j2k09";
  };

})
