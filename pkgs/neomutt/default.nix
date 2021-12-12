final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-11";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "337f967950d2ba3db1c050ba1aa7506c29886590";
    sha256 = "185rn9r1h9p8n7ff6wfx9y9dyqf94rz7gp2wji7iknzjdr303nwd";
  };

})
