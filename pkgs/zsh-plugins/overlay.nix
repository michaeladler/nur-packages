final: prev:

{

  zsh-autosuggestions = prev.zsh-autosuggestions.overrideAttrs (old: {
    version = "unstable-2021-06-04";
    src = prev.fetchFromGitHub {
      owner = "zsh-users";
      repo = "zsh-autosuggestions";
      rev = "a411ef3e0992d4839f0732ebeb9823024afaaaa8";
      sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
    };

  });

  zsh-fast-syntax-highlighting = prev.zsh-fast-syntax-highlighting.overrideAttrs (old: {
    version = "unstable-2021-05-14";
    src = prev.fetchFromGitHub {
      owner = "zdharma";
      repo = "fast-syntax-highlighting";
      rev = "817916dfa907d179f0d46d8de355e883cf67bd97";
      sha256 = "0m102makrfz1ibxq8rx77nngjyhdqrm8hsrr9342zzhq1nf4wxxc";
    };
  });

  zsh-fzf-tab = prev.zsh-fzf-tab.overrideAttrs (old: {
    version = "unstable-2021-06-11";
    src = prev.fetchFromGitHub {
      owner = "Aloxaf";
      repo = "fzf-tab";
      rev = "bc086fc38cfd680a90c694210fa5c5d88e3d1691";
      sha256 = "17in1byqxw8d6av30fpl4dlri2wma543aymp6a9xpibr64lmi373";
    };
  });

  zsh-history-substring-search = prev.zsh-history-substring-search.overrideAttrs (old: {
    version = "unstable-2019-05-12";
    src = prev.fetchFromGitHub {
      owner = "zsh-users";
      repo = "zsh-history-substring-search";
      rev = "0f80b8eb3368b46e5e573c1d91ae69eb095db3fb";
      sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
    };

  });

  zsh-vi-mode = final.callPackage ./zsh-vi-mode { };
  zsh-pandoc-completion = final.callPackage ./zsh-pandoc-completion { };

}
