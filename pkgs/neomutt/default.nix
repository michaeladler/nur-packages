final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-01-27";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "77b59af941a9d53a6ce9144afca88076ffa3582c";
    sha256 = "1gw0ax3bgkcqy2m2ynf76l5xh5zyvq7q78lxqpg308yrjz9v7l6l";
  };

})
