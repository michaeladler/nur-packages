final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-25";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "b463c6d2730b02a773794cd532707df44a50ec3d";
    sha256 = "1s213f4vc12zf2521wwyrrr4v8ams3ipwljv1rxyrxddaqmb1wz6";
  };

})
