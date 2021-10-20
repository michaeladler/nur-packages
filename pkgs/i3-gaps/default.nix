final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-10-19";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "85b9377cde9d1bf0231ba5cb90dee816ab7148e3"; # gaps-next
    sha256 = "1z5gjbvlfn5i3s9dmr4nds1zadh9lbj0h3mvfjmjpjs1v0k437bi";
  };

})
