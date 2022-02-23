final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-22";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "1b215877a557ad8090bd67eff43fffb1dc10c858";
    sha256 = "0siyqhl8ixlgk81164bhql23hfq2909sam24iwkc582ywzpkl5r1";
  };

})
