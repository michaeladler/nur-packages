final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-05-29";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "3a542219f3bf129546ae79eb20e384ea28fa9798";
    sha256 = "1qyy650rwxaakw4hmnvwv7lqxjz22xhbzq8vqlv6ry5g5gmg0gg3";
  };

  patches = [];

})
