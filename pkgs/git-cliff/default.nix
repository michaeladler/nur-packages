{ lib
, naersk-lib
, fetchFromGitHub
}:

naersk-lib.buildPackage {
  pname = "git-cliff";
  version = "unstable-2021-08-14";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = "git-cliff";
    rev = "c5f58213b42fdfd6ec987563c3cdc9f3d152dc06";
    sha256 = "0z5wyajqq3lb3cyf7ksz80lcsbqjn07jhh3qa24wm0sf9yksbihg";
  };

  meta = with lib; {
    description = "A highly customizable Changelog Generator that follows Conventional Commit specifications";
    homepage = "https://github.com/orhun/git-cliff";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
