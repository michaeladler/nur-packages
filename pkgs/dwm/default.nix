final: prev:

prev.dwm.overrideAttrs (old: {
  version = "2021-05-21";

  src = prev.fetchFromGitHub {
    owner = "LukeSmithxyz";
    repo = "dwm";
    rev = "eab52c4f48c0fcfd7c78d41418f2e10dc1b48ed2";
    sha256 = "1dazcwm3l9nnx1h6yv4snr8q4v548b7ri6lly1s7f55nwjwzbyni";
  };

})
