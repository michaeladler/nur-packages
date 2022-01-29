final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-01-29";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "ca0072807cb30ced0e1230dd82c6f707ca9948a6";
    sha256 = "1z7d7a6b4iip63z2v2gh6xxc291d1zkd7w15qnmvv3mxkqki4q16";
  };

})
