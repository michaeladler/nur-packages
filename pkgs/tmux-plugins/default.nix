final: prev:

let fetchFromGitHub = prev.fetchFromGitHub; in

{

  continuum = prev.tmuxPlugins.continuum.overrideAttrs (oa: {
    version = "unstable-2021-06-08";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-continuum";
      rev = "6e58336c288958a3b1ff7773fb945770126db16e";
      sha256 = "10zvhxrinmp673dnjs5264xrgvgdcjhqkhjvmf1dky4qnhlrjx7h";
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
    version = "unstable-2021-07-30";
    src = fetchFromGitHub {
      owner = "dracula";
      repo = "tmux";
      rev = "a66adddfc7f9aedb4995b4b0ffff1ed0785fb85f";
      sha256 = "1ldgc4vl05kr2mfs8vqlk7arvh7ms8vs0waxc82fhgzhkaly2xcz";
    };
  });

  open = prev.tmuxPlugins.open.overrideAttrs (oa: {
    version = "unstable-2020-08-08";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-open";
      rev = "5b09bd955292ae33ef6d3519df09b5bc1b0ff49e";
      sha256 = "1xqkb85yvq7kasgkwjd9ilz5rky8v6dhc33q7k5rqarh7sn5nxxj";
    };
  });

  resurrect = prev.tmuxPlugins.resurrect.overrideAttrs (oa: {
    version = "unstable-2021-07-05";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-resurrect";
      rev = "716b958145e2709e9fd3639ff24e1d1e4f26ff77";
      sha256 = "01j7b6fdam006yr3a2zpnjk2gwzbzc9b3wdnva5p4w5bhz85w76y";
    };

    patches = [ ./patches/tmux-resurrect/0001-Support-for-binary-strategy-files.patch ];
  });

  sensible = prev.tmuxPlugins.sensible.overrideAttrs (oa: {
    version = "unstable-2021-05-20";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-sensible";
      rev = "989d09249e9389604a68d281c999978f6231431b";
      sha256 = "0l1gl1wsd69l5z8zf6mp23x170iyzk5y00pxp3x7f73z7796i9ak";
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
    version = "unstable-2021-05-29";
    src = fetchFromGitHub {
      owner = "christoomey";
      repo = "vim-tmux-navigator";
      rev = "0cabb1ef01af0986b7bf6fb7acf631debdbbb470";
      sha256 = "0xxc5wpyfqv7f7sfy6xncy7ipj0cvshw28s12ld3jfgyimjllr62";
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
    version = "unstable-2021-05-29";
    src = fetchFromGitHub {
      owner = "sainnhe";
      repo = "tmux-fzf";
      rev = "6e70fc5a75c1315cc8f33a6ca44c0f557f1d2de2";
      sha256 = "1w0469qp5akfvmdy72k1hwdsjzsd7pj4dvbjgq5h22bkj60d4r8x";
    };
  });

}
