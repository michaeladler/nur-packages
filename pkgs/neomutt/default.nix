final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-13";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "9dcdbb0c2b208d44e721bac98af965d78244e785";
    sha256 = "0khjc1jwk83hrf0aymmbkv59ckmvi66mlzj8hcz8ickcwf5l0f6y";
  };

})
