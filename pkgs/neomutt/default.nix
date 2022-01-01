final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-31";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "ec2bfc832ae721e27ac55185ef72f85bddf4a8e4";
    sha256 = "05sr5rbza7hql8mdr4yp9avjb8zzzyjx8xd98qdjqlmlrlhy17pm";
  };

})
