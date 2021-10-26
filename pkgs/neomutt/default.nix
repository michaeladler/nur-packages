final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-10-25";

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "fa8a4a270e2d836bad3d114814faa1c56e68dc41";
    sha256 = "19csx58yfb8y0wbjajwhb6v4yyn2napp4jqndxrq01msg4xcnr1i";
  };

})
