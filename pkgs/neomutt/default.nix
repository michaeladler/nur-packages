final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-02";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "5f3961977218c177d574fc36bfce8d831bf28ad1";
    sha256 = "00zzh3dhl9660d1valffzidrgswirgjj5biryrqnxhpnr7hzrbmb";
  };

})
