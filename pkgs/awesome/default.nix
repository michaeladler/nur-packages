final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-06-27";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "02fa372d9e6e692b608cb2e1b46df45984830df1";
    sha256 = "1ihzan11jww0fwwzkrfj46f8qqi6gj31n5i9k6sc7715jb3z15zb";
  };

  patches = [];

})
