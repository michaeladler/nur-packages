final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d1e0f7454b5fc61d26db5af5ce00c1894e7c49fc";
    sha256 = "0dlh0wpzmkj9i4rqqnz1s3lr64mx1440lngyqrbrl1xv58c7pdk7";
    fetchSubmodules = true;
  };

})
