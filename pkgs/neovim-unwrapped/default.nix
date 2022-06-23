final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1b75094e3e1c2ef002f2a089d17553f84e06e06f";
    sha256 = "02yykn5mpxa7iixl3zcnrb9b6246f6nn16wxk5zpd7mnb1x6j0a1";
    fetchSubmodules = true;
  };

})
