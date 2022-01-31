final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-01-30";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "910b80d2d8b85a12c95b1ebda56a84eab5b87119";
    sha256 = "0qp8xsib0wvgq45cdwg5k0j92p67pbi51di031ys8pkhk2732zxg";
  };

})
