final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-09-22";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "4a140ea5ea681e7a0f62d8ef050b0ed1b905cc68";
    sha256 = "0hrfwilgd4vxhqd0hz88hq3j2rizhdlr7g0cq9q8ic0m8z47q1rq";
  };

  patches = [ ];

  cmakeFlags = awesome.cmakeFlags ++ [
    "-DGENERATE_DOC=off"
  ];

  nativeBuildInputs = awesome.nativeBuildInputs ++ [ prev.luajit ];

})
