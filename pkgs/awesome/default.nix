final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-08-18";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "05a405b38bbcb8fa3b344d45d94d4f56b83c74df";
    sha256 = "018pca4wwbvs58ddj67hvapk26a538z7yqw3j7l62wc48mp9841q";
  };

  patches = [];

})
