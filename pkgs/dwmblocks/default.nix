{ orig, fetchFromGitHub }:

orig.overrideAttrs (old: {
  version = "2021-05-23";

  src = fetchFromGitHub {
    owner = "lukesmithxyz";
    repo = "dwmblocks";
    rev = "ea5afdccbd23d61e70f3ef62aabd9b6726b2c20f";
    sha256 = "1f3d933zxh3xca971xhzbkflnkimgvdjfl8pvmv0kjxn9sgq567g";
  };

})
