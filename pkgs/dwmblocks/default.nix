final: prev:

prev.dwmblocks.overrideAttrs (old: {
  version = "2021-07-16";

  src = prev.fetchFromGitHub {
    owner = "lukesmithxyz";
    repo = "dwmblocks";
    rev = "66f31c307adbdcc2505239260ecda24a49eea7af";
    sha256 = "0s379dpn0wppfqwaawg18mn7gzl1b5788sn7bpv41yvm553h4z4g";
  };

})
