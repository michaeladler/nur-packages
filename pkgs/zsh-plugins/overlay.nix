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
    version = "unstable-2021-11-12";
    src = prev.fetchFromGitHub {
      owner = "Aloxaf";
      repo = "fzf-tab";
      rev = "190500bf1de6a89416e2a74470d3b5cceab102ba";
      sha256 = "1dipsy0s67fr47ig5559bcp1h5yn8rdjshhs8zsq7j8plvvh99qb";
    };
  });

  zsh-history-substring-search = prev.zsh-history-substring-search.overrideAttrs (old: {
    version = "unstable-2021-08-02";
    src = prev.fetchFromGitHub {
      owner = "zsh-users";
      repo = "zsh-history-substring-search";
      rev = "4abed97b6e67eb5590b39bcd59080aa23192f25d";
      sha256 = "0s8xdddb6zppc5lj28w44nl4n45wg9ic8x3b5pm1139cv038yj7j";
    };

  });

  zsh-vi-mode = final.callPackage ./zsh-vi-mode { };
  zsh-pandoc-completion = final.callPackage ./zsh-pandoc-completion { };

}
