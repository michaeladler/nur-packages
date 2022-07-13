final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-07-12";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "b7bac1dc761f7e231355e76351500a97b27b6803";
    sha256 = "0140429rlfpfnjz6rviy8s5s7x7pyrs3mmbx0qplkfww0ilrs72b";
  };

  patches = [];

})
