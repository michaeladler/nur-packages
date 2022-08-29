final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-08-29";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "f3cf88593c15a233092972c997528297e546f325";
    sha256 = "1f8vz76l6c3swz3l6wa3j47radxpmzysi12g5va4878zkqp9mzsk";
  };

  patches = [];

})
