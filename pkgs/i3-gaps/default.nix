final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-12-11";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "c7ad7569986f2f54e5c37de0d3a7c13b2d2f0e7e"; # gaps-next
    sha256 = "06fvrg1bam6g1iyraiwzykmwb37ml05mj7k4chami71hyxb79kqc";
  };

})
