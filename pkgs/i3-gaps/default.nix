final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-10-22";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "b154e79d7036b937d131737308c20c6fb161c170"; # gaps-next
    sha256 = "048gqwbb2gf1xlbpds3v3bd78090ja7hr168c7zrrpgx0wsgqcy3";
  };

})
