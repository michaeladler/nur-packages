final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a7332ba9b429f9676723eb88cffb2068f5a95c9b";
    sha256 = "05ryngw8c402khdb7xi9cqz4jcbikiw6gq71xr0ckgvhyvc5hxb0";
    fetchSubmodules = true;
  };

})
