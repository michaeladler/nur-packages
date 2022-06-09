final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2022-06-09";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "522a1a22a30219da892ce64b7140f9005c0f14dd"; # gaps-next
    sha256 = "1p9nzmz51nkw21a5c5d650sy2mc9mhq7xhxdf1aylgylmkhv703v";
  };

})
