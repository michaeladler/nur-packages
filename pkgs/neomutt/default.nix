final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-01-26";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "2f3ac0e094ee4fd15293314231fefdecebbd4764";
    sha256 = "1p6f824jyc8rwjlmnlplwlxmc1081ss3xq4gfxbgl51kcphrbhdk";
  };

})
