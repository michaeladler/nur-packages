final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-09-03";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "c8d4f878a012bc6d6d0e8e520d17a1dd9237336d";
    sha256 = "0zv5wn8dh4a4xn4rzsrwkz41sdix2aqbp9y0nxa04cyjih86scnn";
  };

  patches = [ ];

  cmakeFlags = awesome.cmakeFlags ++ [
    "-DGENERATE_DOC=off"
  ];

  nativeBuildInputs = awesome.nativeBuildInputs ++ [ prev.luajit ];

})
