final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-06-18";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "29c0057795efcd52616e97a8f61c98a4660ae2af";
    sha256 = "049c4cka721y3b8i1kfp0hshf632walbwsfc36l3rg39zhhbk0nr";
  };

  patches = [];

})
