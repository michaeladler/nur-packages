final: prev:

let fetchFromGitHub = prev.fetchFromGitHub; in

{

  continuum = prev.tmuxPlugins.continuum.overrideAttrs (oa: {
    version = "unstable-2021-09-11";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-continuum";
      rev = "44e6be6222a062809d0377e2b05dded900dc260f";
      sha256 = "18arw6f96i7rd1cl0706hqx2yffqsvi24s299ibmsz4y43fzjqfv";
    };
  });

  copycat = prev.tmuxPlugins.copycat.overrideAttrs (oa: {
    version = "unstable-2020-07-24";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-copycat";
      rev = "d7f7e6c1de0bc0d6915f4beea5be6a8a42045c09";
      sha256 = "0nclcmrk0dpa2y9d94xvyfz416xqkslzlfgdj3z8yb6a8vz2xlyr";
    };
  });

  dracula = prev.tmuxPlugins.dracula.overrideAttrs (oa: {
    version = "unstable-2021-10-30";
    src = fetchFromGitHub {
      owner = "dracula";
      repo = "tmux";
      rev = "78869c38cc998f710c12e04d2e3b92c517a4cd65";
      sha256 = "0hj1qiq6g6qnyfdgn9nhlw74ssvpzqfmzcs8v24fdm5mff9g9sr5";
    };
  });

  open = prev.tmuxPlugins.open.overrideAttrs (oa: {
    version = "unstable-2021-09-03";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-open";
      rev = "ab428e710af2c9eb05e794fa01bec9cd4a5f923e";
      sha256 = "0sib9s09cjac2vxhrh33zqfmprfiq30sc7pq31qva3lwp74lmbl8";
    };
  });

  resurrect = prev.tmuxPlugins.resurrect.overrideAttrs (oa: {
    version = "unstable-2021-08-30";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-resurrect";
      rev = "6be2f34b5f06c8a6a23dc3dc835e69c132d58a18";
      sha256 = "0pwkcsnw9kspapmp4npg2b9y60vshnva92j2mg214vlrjzpy9mfl";
    };

    patches = [ ./patches/tmux-resurrect/0001-Support-for-binary-strategy-files.patch ];
  });

  sensible = prev.tmuxPlugins.sensible.overrideAttrs (oa: {
    version = "unstable-2021-08-19";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-sensible";
      rev = "5d089e418efb1a00f47654014ed085deb3d0c878";
      sha256 = "1n0q18adqzsjwg6147inhj14lzqqxkb0ycl68pn064hy7ic6rv5f";
    };
  });

  sessionist = prev.tmuxPlugins.sessionist.overrideAttrs (oa: {
    pluginName = "sessionist";
    version = "unstable-2017-12-03";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-sessionist";
      rev = "09ec86be38eae98ffc27bd0dde605ed10ae0dc89";
      sha256 = "030q2mmj8akbc26jnqn8n7fckg1025p0ildx4wr401b6p1snnlw4";
    };
  });

  tilish = prev.tmuxPlugins.tilish.overrideAttrs (oa: {
    pluginName = "tilish";
    version = "unstable-2021-07-21";
    src = fetchFromGitHub {
      owner = "jabirali";
      repo = "tmux-tilish";
      rev = "fef77c8c499f268311eeab149f1018bfc948543d";
      sha256 = "17znyy1sl13cscjbq75ryji2gvdhahmvxwfh31gpjgrpksfr1zll";
    };
  });


  vim-tmux-navigator = prev.tmuxPlugins.vim-tmux-navigator.overrideAttrs (oa: {
    version = "unstable-2021-10-10";
    src = fetchFromGitHub {
      owner = "christoomey";
      repo = "vim-tmux-navigator";
      rev = "9ca5bfe5bd274051b5dd796cc150348afc993b80";
      sha256 = "11qv4bqwwf7wh3l729c9za6kzpyry91q3cks2z51znppkyd20gb7";
    };
  });

  yank = prev.tmuxPlugins.yank.overrideAttrs (oa: {
    version = "unstable-2020-10-02";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-yank";
      rev = "1b1a436e19f095ae8f825243dbe29800a8acd25c";
      sha256 = "02v6g6wrqzzjk4l2mcna1lg8100g5h88phy9g6f6rbcqzw2y86w5";
    };
  });

  tmux-fzf = prev.tmuxPlugins.tmux-fzf.overrideAttrs (oa: {
    version = "unstable-2021-10-20";
    src = fetchFromGitHub {
      owner = "sainnhe";
      repo = "tmux-fzf";
      rev = "1801dd525b39154745ea668fb6916035023949e3";
      sha256 = "03wa436hgbwhfgqjjmyqhjwljyjk9xdlg03mlwdnmdjym4kbvpbv";
    };
    postInstall = "true";

  });

}
