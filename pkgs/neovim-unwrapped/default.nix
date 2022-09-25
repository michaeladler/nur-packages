final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-25";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b0fcdf9f099b17198630025a700e87f05b4e3a84";
    sha256 = "10f3cqahnlcd6kjarprkfbpkhxmjwhyiysfz8vk5r6h359z9lhr6";
    fetchSubmodules = true;
  };

})
