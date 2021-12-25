final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-24";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "d9f13d418c31b93e2cefd638feefe94964953ef5";
    sha256 = "0c8j43qa4r5ngnmjap329nbjdn6xr6hwk0gx76fp0dk3bijgrqyf";
  };

})
