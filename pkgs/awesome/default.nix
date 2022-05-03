final: prev:

let awesome = prev.awesome.override { lua = prev.luajit; }; in

awesome.overrideAttrs (old: {
  version = "unstable-2022-03-21";

  src = final.fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "c539e0e4350a42f813952fc28dd8490f42d934b3";
    sha256 = "111sgx9sx4wira7k0fqpdh76s9la3i8h40wgaii605ybv7n0nc0h";
  };

})
