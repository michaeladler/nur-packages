final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "565442ec421eeef0abe915d23ba481e8b75c6c38";
    sha256 = "1pk9pwzzxgwrflfbkzdsc6lfzsd69knk2xzzb3r9gckhbx9v6v48";
    fetchSubmodules = true;
  };

})
