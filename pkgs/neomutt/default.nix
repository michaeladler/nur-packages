final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-19";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "f637c8bcd6028a2d444652a60a2b211a413f9f62";
    sha256 = "05v8a4mv42d39iadxiyams6pvs651dvwyv4qw1lsq9j75r86nv77";
  };

})
