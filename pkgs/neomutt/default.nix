final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-26";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "395f43b37c8b962d8ee59bf0a04b88619f23242b";
    sha256 = "1yhyvd6wmmx32wk6ha8a3bdz2fv39mnmv6mldgvmdhg40na579kc";
  };

})
