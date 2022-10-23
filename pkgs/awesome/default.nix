final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-10-22";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "a436478731936812e82ef17b78cc4979d5db6ad6";
    sha256 = "1j4wyqfm7p6bqq6z5c9h5q7klqgfabq3p2351r0n6473x3780myc";
  };

  patches = [ ];

  cmakeFlags = awesome.cmakeFlags ++ [
    "-DGENERATE_DOC=off"
  ];

  nativeBuildInputs = awesome.nativeBuildInputs ++ [ prev.luajit ];

})
