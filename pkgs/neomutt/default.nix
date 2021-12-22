final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-21";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "ec24fbca8797eac71cb79f4e7184482c72ed24e6";
    sha256 = "0i05hs3rj4pcq9j0prc21j8rx2nrm6kpyjl7cs800ax4ppj9pn44";
  };

})
