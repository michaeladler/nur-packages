final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-09-20";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "f8e0dfd486f80a9ee255d4384d4787a9e1a0d3e2";
    sha256 = "1vh1hr5wjgjsmqz5z03alhfg6f70xgz9cmq1zkwamz92zxa2hwki";
  };

  patches = [ ];

  cmakeFlags = awesome.cmakeFlags ++ [
    "-DGENERATE_DOC=off"
  ];

  nativeBuildInputs = awesome.nativeBuildInputs ++ [ prev.luajit ];

})
