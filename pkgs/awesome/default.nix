final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2023-01-16";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "b54e50ad6cfdcd864a21970b31378f7c64adf3f4";
    sha256 = "1cd1jirhndss583agxrapq9wf6q7m27gv95wdmx4bbzrykac4df8";
  };

  patches = [ ];

  cmakeFlags = awesome.cmakeFlags ++ [
    "-DGENERATE_DOC=off"
  ];

  nativeBuildInputs = awesome.nativeBuildInputs ++ [ prev.luajit ];

})
