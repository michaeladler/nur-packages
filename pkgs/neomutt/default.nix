final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-03-08";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "e841e0204f534447a5d725dfcf419a0ae8cfa04e";
    sha256 = "0fjfqcy3q2l97jx82dsf9rq7d9hf6nafkzbxlwq4qq98xk8mxfy8";
  };

})
