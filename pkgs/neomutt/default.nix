final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-18";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "b77af02186a3c800ca04ddbee9fccf9188877dee";
    sha256 = "0c1s3hxvf7priq794az10va630rj8hhb33hi1f95scmd0kf3ncij";
  };

})
