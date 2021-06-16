final: prev:

prev.zsh-autosuggestions.overrideAttrs (old: {

  version = "2021-06-04";

  src = prev.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-autosuggestions";
    rev = "a411ef3e0992d4839f0732ebeb9823024afaaaa8";
    sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
  };

})
