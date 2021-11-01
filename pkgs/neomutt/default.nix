final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-10-31";

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "8a0f62fb8793eeb5154f3adaf59c8e879ad26cf7";
    sha256 = "17gq9jlf1jqjpwnf6gb732h1cshpvgbrdav12y045xk4rfl6802x";
  };

})
