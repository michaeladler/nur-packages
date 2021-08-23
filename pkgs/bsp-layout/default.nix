final: prev:

prev.bsp-layout.overrideAttrs (old: {

  version = "unstable-2021-05-10";
  src = prev.fetchFromGitHub {
    owner = "phenax";
    repo = "bsp-layout";
    rev = "726b850b79eabdc6f4d236cff52e434848cb55e3";
    sha256 = "1wqlzbz7l9vz37gin2zckrnxkkabnd7x5mi9pb0x96w4yhld5mx6";
  };

})
