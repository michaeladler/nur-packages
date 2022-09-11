final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-09-10";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "6ca2fbb31c5cdf50b946b50f3f814f39a8f1cfbe";
    sha256 = "1s9a6mh6ckvkrwv5c502qhi0bq7295dsb1ji1w3x4gg6ri3g887c";
  };

  patches = [ ];

  cmakeFlags = awesome.cmakeFlags ++ [
    "-DGENERATE_DOC=off"
  ];

  nativeBuildInputs = awesome.nativeBuildInputs ++ [ prev.luajit ];

})
