final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "dc7edce650bc2abbcad2fdc12cb77561b36b35af";
    sha256 = "0zggql1r2gnnpjyamlj59418nkkj2lxrizd9pajwma8ydf54i9nc";
    fetchSubmodules = true;
  };

})
