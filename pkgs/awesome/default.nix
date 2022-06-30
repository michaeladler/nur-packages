final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-06-30";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "a5c84896efb80fa760ee1f952cb9c0d0fe01c38e";
    sha256 = "0mvky7258w70shhzbb4p2znljkmfa7dd5hr96ghqciq2y8b39qa9";
  };

  patches = [];

})
