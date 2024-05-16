final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2024-05-16";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "27fb62988e922c2739035f477f93cc052a4fee1e"; # tags/*
    sha256 = "0bd9hxnskyfg7k51yxf3gnqhv9l3y4m91yqd8svzj7d5sb2jxc1n";
    fetchSubmodules = true;
  };

  patches = [ ];

})
