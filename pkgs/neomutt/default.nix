final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-28";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "6b893166b9d724e22db0b45803fc4a45ccb2fb17";
    sha256 = "1bidv52myjgd9m11hsfd0r85snppxcnpj0wasinpfc4636vkbjcr";
  };

})
