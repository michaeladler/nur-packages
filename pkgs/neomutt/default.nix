final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-03-01";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "f757a4c8dd2a43ee0fb65504c9e66594131c4e78";
    sha256 = "0833w3nn5zz1bb5kq959kdqp4zpliqffwbxf0fx2xjcgbv5y14ds";
  };

})
