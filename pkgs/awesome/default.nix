final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-09-29";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "b16f62862019b7d51711ff31384c173d07f89eda";
    sha256 = "12dbxqsri6sgy0k04l3x2qn7axg5pf53hv5x8playpv52bq21a2h";
  };

  patches = [ ];

  cmakeFlags = awesome.cmakeFlags ++ [
    "-DGENERATE_DOC=off"
  ];

  nativeBuildInputs = awesome.nativeBuildInputs ++ [ prev.luajit ];

})
