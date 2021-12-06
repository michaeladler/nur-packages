final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-12-06";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "3cf7df6108819ff5c6f38b273cfbdc5763bb7f46"; # gaps-next
    sha256 = "0kvx9k6kg85cvzq7492nnp7jlvak3d5jmi5cj59z5xcq5j549lqn";
  };

})
