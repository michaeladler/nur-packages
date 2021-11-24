final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-23";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "be4745d3e86a812b25a39455a7b6456a99b2f112";
    sha256 = "1v05r5m1wd6fi31f45xfbqy12ci1q68vxg8xdc0viya102zw4bl8";
  };

})
