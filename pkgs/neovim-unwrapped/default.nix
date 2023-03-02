final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fb1db80f5ab707e188be3c60539fa38eaf996f24";
    sha256 = "1nf6capwjjvsqsr8bi12f1kyw6xwi7w9shhb70dv409k6mhjzay0";
    fetchSubmodules = true;
  };

})
