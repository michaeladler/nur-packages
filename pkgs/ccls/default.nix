final: prev:

prev.ccls.overrideAttrs (old: {
  version = "unstable-2021-03-30";

  src = prev.fetchFromGitHub {
    owner = "MaskRay";
    repo = "ccls";
    rev = "0ada56ef3bb785b9b56eeebb70dff2aad60b3f39"; # tags/*
    sha256 = "0zzdn7c7a244djqwcsd7rvgclcdacyf9d0vkxpfspl83k2554alf";
  };

})
