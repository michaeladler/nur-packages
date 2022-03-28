final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2022-03-28";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "8447a9bc6b1b3682e1eeb06f4d129b7e2a1457ac"; # gaps-next
    sha256 = "1scwcnsw9q3h7r70c0v4sm7pscgd1ai3wjx01j4cdw54vic29xab";
  };

})
