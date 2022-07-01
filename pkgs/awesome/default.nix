final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-06-30";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "9ca7bb487a5d1d2d5c102f94cd9e8cb5b6e7ffaa";
    sha256 = "0h7wn54hh546kpjwah9a3sl47r7nrvjzscldbhpllbhdhq0706j5";
  };

  patches = [];

})
