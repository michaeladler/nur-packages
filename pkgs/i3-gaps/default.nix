final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2022-02-10";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "a661d82c22ab6daef3ad891c18ae016dfb7d1617"; # gaps-next
    sha256 = "1cnijr7gd59bx4v0sawjm6cd4nm8yfwpsff09fifvhcj9630r0ar";
  };

})
