final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-08";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "d3d90304f0a52af29cb08de7c1ac22874f2329dc";
    sha256 = "1180mqdsp461i4xdjh9xmi8hmxmvqvz0kbx3am43m556y0sizqz2";
  };

})
