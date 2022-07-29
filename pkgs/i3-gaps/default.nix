final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2022-07-28";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "dd1d2a6efb29eb6eefae5876e1c1c0caa90061b7"; # gaps-next
    sha256 = "0x1sgd3b7sv2cyh0kzphik15cc4kjzfxa8mlc9cblgyzh5q8cpkh";
  };

})
