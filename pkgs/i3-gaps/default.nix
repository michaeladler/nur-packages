final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2022-02-07";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "66f58936506698a7538411d0c8346e4bf5c7a6a4"; # gaps-next
    sha256 = "0fgdsa7k7627xslz31z8nnljzqlsrml86jhnvwhhlqpn0gi8krvw";
  };

})
