final: prev:

let
  inherit (prev.vimUtils.override { inherit (prev.vim); }) buildVimPluginFrom2Nix;
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  ale = prev.vimPlugins.ale.overrideAttrs (old: {
    version = "2021-06-22";
    src = fetchFromGitHub {
      owner = "dense-analysis";
      repo = "ale";
      rev = "a4ba421803d030a8967ede111ce921d439aa5fbb";
      sha256 = "1p047is3c6cw3qbhcnxznqcp7754c7xis1zwkc7sjs7xrc17rkmn";
      fetchSubmodules = true;
    };
  });

  barbar-nvim = prev.vimPlugins.barbar-nvim.overrideAttrs (old: {
    version = "2021-06-12";
    src = fetchFromGitHub {
      owner = "romgrk";
      repo = "barbar.nvim";
      rev = "33639e53d0bf69444275ed048c5bfd7e29396634";
      sha256 = "0zqc4j0nbdhap8a67529n2k4k53xnqxrjsn2a4sdqdwvm207y6r9";
    };
  });

  dracula-vim = prev.vimPlugins.dracula-vim.overrideAttrs (old: {
    version = "2021-06-04";
    src = fetchFromGitHub {
      owner = "dracula";
      repo = "vim";
      rev = "869f70a7603b77cdb2f63983dd286f3f61b7a966";
      sha256 = "031c000nr2raw0v6bdnisczjz20y5iw0yapj8wih0nc703dirhih";
    };
  });

  editorconfig-vim = prev.vimPlugins.editorconfig-vim.overrideAttrs (old: {
    version = "2021-04-04";
    src = fetchFromGitHub {
      owner = "editorconfig";
      repo = "editorconfig-vim";
      rev = "f305bc77faef4b418aee65682d7d147f64cfd5a9";
      sha256 = "1yr8jni3z9sf348d8zw532vj4s1ww62yfslfcdgkgwhba1l2vy53";
      fetchSubmodules = true;
    };
  });

  file-line = prev.vimPlugins.file-line.overrideAttrs (old: {
    version = "2016-10-20";
    src = fetchFromGitHub {
      owner = "bogado";
      repo = "file-line";
      rev = "559088afaf10124ea663ee0f4f73b1de48fb1632";
      sha256 = "1w183g0hj8jvzm6m1jw7m6xz3x1dld8n8342vnycsh6hyzdcg3mg";
    };
  });

  friendly-snippets = prev.vimPlugins.friendly-snippets.overrideAttrs (old: {
    version = "2021-06-25";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "3dca3fc854b72a72233341f4ae51cebd7a864234";
      sha256 = "1saasvazmxq5ll0fna0a8kx5q8lq9mg0ldkj1k4g13h9g34sdwgg";
    };
  });

  gina-vim = prev.vimPlugins.gina-vim.overrideAttrs (old: {
    version = "2021-06-12";
    src = fetchFromGitHub {
      owner = "lambdalisue";
      repo = "gina.vim";
      rev = "abdbe0fe33f3b6fc59e94f7cc3072768f8dfd8ac";
      sha256 = "1f3shh6jxr5i1an2dbb1vmc0l2xg03fm6ava25ahxg4b5ka59bc5";
    };
  });

  neoformat = prev.vimPlugins.neoformat.overrideAttrs (old: {
    version = "2021-04-19";
    src = fetchFromGitHub {
      owner = "sbdchd";
      repo = "neoformat";
      rev = "1a49552cdaddeaaa766a6f0016effe530634b39f";
      sha256 = "114mp407vck6bm224mig91rka5k7jj6641lllijwj25b3yfkgkmr";
    };
  });

  nvim-colorizer-lua = prev.vimPlugins.nvim-colorizer-lua.overrideAttrs (old: {
    version = "2020-06-11";
    src = fetchFromGitHub {
      owner = "norcalli";
      repo = "nvim-colorizer.lua";
      rev = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6";
      sha256 = "0gvqdfkqf6k9q46r0vcc3nqa6w45gsvp8j4kya1bvi24vhifg2p9";
    };
  });

  nvim-compe = prev.vimPlugins.nvim-compe.overrideAttrs (old: {
    version = "2021-06-19";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-compe";
      rev = "f176c41f1e67bffe2dbd28f371fa55c172cf1c56";
      sha256 = "1yys3m1wmpwr44zx2my975rg2bj2d7j4pzcvfkyccqi36z3g7d8m";
    };
  });

  completion-buffers = prev.vimPlugins.completion-buffers.overrideAttrs (old: {
    version = "2021-01-17";
    src = fetchFromGitHub {
      owner = "steelsojka";
      repo = "completion-buffers";
      rev = "c36871b2a44b59761387f4972c617b44dcec5e75";
      sha256 = "14rxmy3cjrl7lr4yvrk7nkhc5h8rlpj7xjixzgr0vmnbsl885kyh";
    };
  });

  completion-nvim = prev.vimPlugins.completion-nvim.overrideAttrs (old: {
    version = "2021-06-16";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "completion-nvim";
      rev = "d62fff879b29fa1ce915887a75305af0fff57d32";
      sha256 = "0hfsz06djyja8phj099fmbg2sa9jj89rqxvizwhwdxadshmr1f20";
    };
  });

  nvim-lightbulb = prev.vimPlugins.nvim-lightbulb.overrideAttrs (old: {
    version = "2021-06-05";
    src = fetchFromGitHub {
      owner = "kosayoda";
      repo = "nvim-lightbulb";
      rev = "388cc8caaf3e10836810aabbb9283a27dd8584cd";
      sha256 = "0a7izbvpwn0sx9gvpczvl57fy9rm7jaibc4m44asjz501m04lbra";
    };
  });

  lspkind-nvim = prev.vimPlugins.lspkind-nvim.overrideAttrs (old: {
    version = "2021-05-22";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind-nvim";
      rev = "3469f0c9a6767625d532a74a167f5d6ba2b8c5bf";
      sha256 = "1ff1i6m9kk3n36n24c109g6yddcbbzm10iigvi0pv1z2fdpsrl07";
    };
  });

  lsp-status-nvim = prev.vimPlugins.lsp-status-nvim.overrideAttrs (old: {
    version = "2021-05-20";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "lsp-status.nvim";
      rev = "54c395248539d65fddda46f7d92e3421856874c1";
      sha256 = "1qfrfckdbqyav8l1g7lwpjrrwh559nm71ki74qd1xd18y1h63ny2";
    };
  });

  nvim-lspconfig = prev.vimPlugins.nvim-lspconfig.overrideAttrs (old: {
    version = "2021-06-20";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "48e47b4d26e45977d27c06dc1bc116416ca9276d";
      sha256 = "1zf4sv91i3qkr9d8cbn9vzk2sc5bknjsjdhzvpf1zjr72bxx3q37";
    };
  });

  nvim-peekup = prev.vimPlugins.nvim-peekup.overrideAttrs (old: {
    version = "2021-04-04";
    src = fetchFromGitHub {
      owner = "gennaro-tedesco";
      repo = "nvim-peekup";
      rev = "2f03df68bced26399b7576818b3cded3ce334ca0";
      sha256 = "1bap28b9jbaywll50mwjfp91i0h671762ylgy3fxhnayf78py00d";
    };
  });

  nvim-treesitter = prev.vimPlugins.nvim-treesitter.overrideAttrs (old: {
    version = "2021-06-25";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "5e500cbc8816d5cec7ad21398f6be2fe608583e6";
      sha256 = "1fj7g7bwal9cz3fkvdn57xbbdln730qqmrbm80wbvs49dr2psjbk";
    };
  });

  nvim-treesitter-refactor = prev.vimPlugins.nvim-treesitter-refactor.overrideAttrs (old: {
    version = "2021-05-03";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-refactor";
      rev = "1a377fafa30920fa974e68da230161af36bf56fb";
      sha256 = "06vww83i73f4gyp3x0007qqdk06dd2i9v1v9dk12ky9d8r0pmxl6";
    };
  });

  nvim-treesitter-textobjects = prev.vimPlugins.nvim-treesitter-textobjects.overrideAttrs (old: {
    version = "2021-06-25";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "2271ffecd5fad9c74fb12c125f39a21ffb5a7673";
      sha256 = "1acmhal848jjxv12cp4ihd3jmg6rj8q31v2si15chzap4iizhchc";
    };
  });

  papercolor-theme = prev.vimPlugins.papercolor-theme.overrideAttrs (old: {
    version = "2020-12-04";
    src = fetchFromGitHub {
      owner = "NLKNguyen";
      repo = "papercolor-theme";
      rev = "845cfa94d95d404ff59e0bdc578b299279e1dc07";
      sha256 = "1r6p9ll3bfblz9sfzg0391zjswvmi8wwcc010w8mjsayjclmpwf8";
    };
  });

  plenary-nvim = prev.vimPlugins.plenary-nvim.overrideAttrs (old: {
    version = "2021-06-19";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "268002fdba2f8f5a4e86574e3b9924ad6d42da20";
      sha256 = "07zskz9b5s4cainjqj431b2skzdrhnm8agydmjxmw13qjmwj0q7z";
    };
  });

  popup-nvim = prev.vimPlugins.popup-nvim.overrideAttrs (old: {
    version = "2021-05-08";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "popup.nvim";
      rev = "5e3bece7b4b4905f4ec89bee74c09cfd8172a16a";
      sha256 = "1k6rz652fjkzhjd8ljr0l6vfispanrlpq0r4aya4qswzxni4rxhg";
    };
  });

  rust-vim = prev.vimPlugins.rust-vim.overrideAttrs (old: {
    version = "2021-02-16";
    src = fetchFromGitHub {
      owner = "rust-lang";
      repo = "rust.vim";
      rev = "87c745d8d506fc1eecc1d81df15d5bde1658a2fc";
      sha256 = "0v0ip731lclh9aqrmlqwnnz4skgawaq3invghh1c7lh0zdq22lzb";
    };
  });

  tabular = prev.vimPlugins.tabular.overrideAttrs (old: {
    version = "2019-02-19";
    src = fetchFromGitHub {
      owner = "godlygeek";
      repo = "tabular";
      rev = "339091ac4dd1f17e225fe7d57b48aff55f99b23a";
      sha256 = "0jq91770wsp2waw7pywxjqx59v0vg54gfzirgcd85pg61w22bfla";
    };
  });

  telescope-nvim = prev.vimPlugins.telescope-nvim.overrideAttrs (old: {
    version = "2021-06-14";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "6ac5ee0854fe02d651cadf2fc97a2463ff92f322";
      sha256 = "1k2glya8cd000kzfvx5fif9fcqvcq1k2vrkwyzhfm4yngz7bxm1p";
    };
  });

  undotree = prev.vimPlugins.undotree.overrideAttrs (old: {
    version = "2021-05-28";
    src = fetchFromGitHub {
      owner = "mbbill";
      repo = "undotree";
      rev = "1cc3b9069e4356efd4ce1c3c4bdbb227fb54e1e5";
      sha256 = "0m8wc66ml2h6lsbwq452w8y9s95a4kwp4lfdw94pi4q3h5qhvkxj";
    };
  });

  vim-better-whitespace = prev.vimPlugins.vim-better-whitespace.overrideAttrs (old: {
    version = "2020-03-24";
    src = fetchFromGitHub {
      owner = "ntpeters";
      repo = "vim-better-whitespace";
      rev = "8cf4b2175dd61416c2fe7d3234324a6c59d678de";
      sha256 = "1iga1xdzygnr9rhv0kw01nr3vahl2d486p06slmri2vy8ngzym0q";
    };
  });

  vim-commentary = prev.vimPlugins.vim-commentary.overrideAttrs (old: {
    version = "2021-03-22";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-commentary";
      rev = "349340debb34f6302931f0eb7139b2c11dfdf427";
      sha256 = "01lpfcn2hmvxddcf97f4qx5vksxj1hwrxb0c8ri59z9lb9z2hgjd";
    };
  });

  vim-cool = prev.vimPlugins.vim-cool.overrideAttrs (old: {
    version = "2020-04-18";
    src = fetchFromGitHub {
      owner = "romainl";
      repo = "vim-cool";
      rev = "27ad4ecf7532b750fadca9f36e1c5498fc225af2";
      sha256 = "1in44gf7hs978nc9328zh1kj3jh04kcinw0m8spcbgj079782sg8";
    };
  });

  vim-dispatch = prev.vimPlugins.vim-dispatch.overrideAttrs (old: {
    version = "2021-04-17";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-dispatch";
      rev = "250ea269e206445d10700b299afd3eb993e939ad";
      sha256 = "1fcp2nsgamkxm7x0mn1n3xp02dc7x773cdp9p30ikqn44pzgyq10";
    };
  });

  vim-json = prev.vimPlugins.vim-json.overrideAttrs (old: {
    version = "2018-01-10";
    src = fetchFromGitHub {
      owner = "elzr";
      repo = "vim-json";
      rev = "3727f089410e23ae113be6222e8a08dd2613ecf2";
      sha256 = "1c19pqrys45pzflj5jyrm4q6hcvs977lv6qsfvbnk7nm4skxrqp1";
    };
  });

  vim-lastplace = prev.vimPlugins.vim-lastplace.overrideAttrs (old: {
    version = "2021-03-29";
    src = fetchFromGitHub {
      owner = "farmergreg";
      repo = "vim-lastplace";
      rev = "8f6c4454eb462776b6ebdc48e3e29a68ddeb726d";
      sha256 = "04x6y9yp5xlds37bswmrc3xlhhjfln9nzrkippvvhl48b0kfnpj8";
    };
  });

  vim-nix = prev.vimPlugins.vim-nix.overrideAttrs (old: {
    version = "2021-05-28";
    src = fetchFromGitHub {
      owner = "LnL7";
      repo = "vim-nix";
      rev = "63b47b39c8d481ebca3092822ca8972e08df769b";
      sha256 = "08n9cgphv2m96kk5w996lwlqak011x5xm410hajmc91vy5fws361";
    };
  });

  vim-obsession = prev.vimPlugins.vim-obsession.overrideAttrs (old: {
    version = "2021-03-22";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-obsession";
      rev = "82c9ac5e130c92a46e043dd9cd9e5b48d15e286d";
      sha256 = "0lfcba8sk25l5yp3agh6pwniddf8jx627ikpr8i2z9ary2fqsj98";
    };
  });

  vim-prosession = prev.vimPlugins.vim-prosession.overrideAttrs (old: {
    version = "2021-03-21";
    src = fetchFromGitHub {
      owner = "dhruvasagar";
      repo = "vim-prosession";
      rev = "976f3e61c2dd4ab709ea5eccbbab9e42d35d7e8c";
      sha256 = "01dbiwj1x8rd5yy19cphxysga3fi5l3il2ph8hr1v4adzvw8269z";
    };
  });

  vim-repeat = prev.vimPlugins.vim-repeat.overrideAttrs (old: {
    version = "2021-01-24";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-repeat";
      rev = "24afe922e6a05891756ecf331f39a1f6743d3d5a";
      sha256 = "0y18cy5wvkb4pv5qjsfndrpcvz0dg9v0r6ia8k9isp4agdmxkdzj";
    };
  });

  vim-sensible = prev.vimPlugins.vim-sensible.overrideAttrs (old: {
    version = "2019-11-24";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-sensible";
      rev = "2d9f34c09f548ed4df213389caa2882bfe56db58";
      sha256 = "153i3kh44ri046va3qdrbvvsv7gy25fsd9pc2yhrg23lvj169zfp";
    };
  });

  vim-sneak = prev.vimPlugins.vim-sneak.overrideAttrs (old: {
    version = "2020-08-31";
    src = fetchFromGitHub {
      owner = "justinmk";
      repo = "vim-sneak";
      rev = "65e5e4668371152c6ef7a6269c6a6b960cef21b4";
      sha256 = "0bfibshqqa17n9vbdd2g8kalnc78v1ag3hzws9pdacrcsxhsh0ry";
    };
  });

  vim-startuptime = prev.vimPlugins.vim-startuptime.overrideAttrs (old: {
    version = "2021-05-29";
    src = fetchFromGitHub {
      owner = "dstein64";
      repo = "vim-startuptime";
      rev = "7a97baae32bedbf6f62d5a573777e4d1652787d1";
      sha256 = "1sphykwbjd35kwsibm9wcxbs2iwjkzkg7madqvlxzi7sqh4vkc7y";
    };
  });

  vim-surround = prev.vimPlugins.vim-surround.overrideAttrs (old: {
    version = "2019-11-28";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-surround";
      rev = "f51a26d3710629d031806305b6c8727189cd1935";
      sha256 = "0aqrqn35xdiy80y7skxfsh3m33n6cdxw6lzz6aspfgzwllx2f0kr";
    };
  });

  vim-tmux-navigator = prev.vimPlugins.vim-tmux-navigator.overrideAttrs (old: {
    version = "2021-05-29";
    src = fetchFromGitHub {
      owner = "christoomey";
      repo = "vim-tmux-navigator";
      rev = "0cabb1ef01af0986b7bf6fb7acf631debdbbb470";
      sha256 = "0xxc5wpyfqv7f7sfy6xncy7ipj0cvshw28s12ld3jfgyimjllr62";
    };
  });

  vim-toml = prev.vimPlugins.vim-toml.overrideAttrs (old: {
    version = "2020-12-07";
    src = fetchFromGitHub {
      owner = "cespare";
      repo = "vim-toml";
      rev = "3c5face8e8944a217af45bc5bb708ff7dfcf1a54";
      sha256 = "0g3hj9lcwd2vzcfkdrydhga2n82144llkvrxcjdn6zl84pjcvgd2";
    };
  });

  vim-vinegar = prev.vimPlugins.vim-vinegar.overrideAttrs (old: {
    version = "2021-03-15";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-vinegar";
      rev = "b245f3ab4580eba27616a5ce06a56d5f791e67bd";
      sha256 = "0lvqfa5drjzk3b877aldnjc9m4jnwlpxlvfvy8s81az92r69f13m";
    };
  });

  vim-vsnip = prev.vimPlugins.vim-vsnip.overrideAttrs (old: {
    version = "2021-06-01";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "vim-vsnip";
      rev = "552403842b992efde3816a89b20055f7d66d9a0d";
      sha256 = "1pkkysv2mnbzm2bi33l1xccdb6sh06dgyg83dg0dgd0gmp94l7ya";
    };
  });

  vim-which-key = prev.vimPlugins.vim-which-key.overrideAttrs (old: {
    version = "2021-05-04";
    src = fetchFromGitHub {
      owner = "liuchengxu";
      repo = "vim-which-key";
      rev = "da2934fcd36350b871ed8ccd54c8eae3a0dfc8ae";
      sha256 = "18n5mqwgkjsf67jg2r24d4w93hadg7fnqyvmqq6dd5bsmqwp9v14";
    };
  });

  zig-vim = prev.vimPlugins.zig-vim.overrideAttrs (old: {
    version = "2021-06-24";
    src = fetchFromGitHub {
      owner = "ziglang";
      repo = "zig.vim";
      rev = "fb534e7d12be7e529f79ad5ab99c08dc99f53294";
      sha256 = "17dpkkgazrzym2yqhb6r07y3hxl3hq9yzwkrb1zii94ss4d8lhw9";
    };
  });

  vim-go = prev.vimPlugins.vim-go.overrideAttrs (old: {
    version = "2021-06-12";
    src = fetchFromGitHub {
      owner = "fatih";
      repo = "vim-go";
      rev = "57e01d258804fa8a0a2f2e62b33130ecd7d1b57f";
      sha256 = "18hn9x2yfr3h1ji13rkp65lgpcljlp7agkhj3argyymzwid5bxzm";
    };
  });

  galaxyline-nvim = prev.vimPlugins.galaxyline-nvim.overrideAttrs (old: {
    version = "2021-04-25";
    src = fetchFromGitHub {
      owner = "glepnir";
      repo = "galaxyline.nvim";
      rev = "d544cb9d0b56f6ef271db3b4c3cf19ef665940d5";
      sha256 = "1390lqsqdcj1q89zn6y5qrm1id7p8fnpy07vlz6mm4cki47211mb";
    };

    dependencies = (old.dependencies or [ ]) ++ [ final.vimPlugins.nvim-web-devicons ];
  });

  vim-pandoc-syntax = prev.vimPlugins.vim-pandoc-syntax.overrideAttrs (old: {
    version = "2021-03-10";
    src = fetchFromGitHub {
      owner = "vim-pandoc";
      repo = "vim-pandoc-syntax";
      rev = "aba6b5596cf0e879a83a2aa5edc93e5e5753bea8";
      sha256 = "0hgzmfcyl3qhdmyyxdaynlm7psk164v8xg5j1kvdaxxgj4lwbnig";
    };
  });

  vim-pandoc = prev.vimPlugins.vim-pandoc.overrideAttrs (old: {
    version = "2021-06-09";
    src = fetchFromGitHub {
      owner = "vim-pandoc";
      repo = "vim-pandoc";
      rev = "1c56693951ce81f344cff0d7c8a6f7ea62a06981";
      sha256 = "017g2cq05pfxjmcdm42qz6pv2cf2v18lnnrfnizm1cd388r9byll";
    };

    dependencies = (old.dependencies or [ ]) ++ [ final.vimPlugins.vim-pandoc-syntax ];
  });

  vim-markdown = prev.vimPlugins.vim-markdown.overrideAttrs (old: {
    version = "2020-07-14";
    src = fetchFromGitHub {
      owner = "plasticboy";
      repo = "vim-markdown";
      rev = "8e5d86f7b85234d3d1b4207dceebc43a768ed5d4";
      sha256 = "013vh2rnfifm5j56imar03rvchz68ll4lbgy9y8fbw7s9a0k6yaa";
    };

    dependencies = (old.dependencies or [ ]) ++ [ final.vimPlugins.tabular ];
  });

  nvim-web-devicons = prev.vimPlugins.nvim-web-devicons.overrideAttrs (old: {
    version = "2021-05-19";
    src = fetchFromGitHub {
      owner = "kyazdani42";
      repo = "nvim-web-devicons";
      rev = "da717e19678bd6ec33008cf92da05da1b8ceb87d";
      sha256 = "0jvvjpbxdgch0wvgdmihkqng84rwifq74q858cvfahrx3y5y1cnw";
    };
  });

  ###############################################################################
  # the following plugins are not (yet) available in nixpkgs:
  ###############################################################################
  vim-ingo-library = buildVimPluginFrom2Nix ({
    pname = "vim-ingo-library";

    version = "2021-06-11";
    src = fetchFromGitHub {
      owner = "inkarkat";
      repo = "vim-ingo-library";
      rev = "c155c65398733c764bd104edf15eabec5a8ae89d";
      sha256 = "1b9d02jjh5qm36c09ivb59wfas6zixchmgqccqbjr57pcq7bfdm1";
    };

    meta.homepage = "https://github.com/inkarkat/vim-ingo-library/";
  });

  vim-SpellCheck = buildVimPluginFrom2Nix ({
    pname = "vim-SpellCheck";
    version = "2020-08-18";
    src = fetchFromGitHub {
      owner = "inkarkat";
      repo = "vim-SpellCheck";
      rev = "fe5c9488d3082c246f73bfca137052930b13424f";
      sha256 = "1vqzk56x9jq4gcb9gsphjid50hn5q4afi5pyxsr92cqdbjwfi2bx";
    };

    meta.homepage = "https://github.com/inkarkat/vim-SpellCheck/";
    dependencies = [ final.vimPlugins.vim-ingo-library ];
  }
  );

  FixCursorHold-nvim = buildVimPluginFrom2Nix ({
    pname = "FixCursorHold-nvim";

    version = "2021-04-16";
    src = fetchFromGitHub {
      owner = "antoinemadec";
      repo = "FixCursorHold.nvim";
      rev = "b5158c93563ee6192ce8d903bfef839393bfeccd";
      sha256 = "1y6hv7vl268zbf3bzd72l43jjgi0cq364p15z8ia9jlph1syk9zz";
    };

    meta.homepage = "https://github.com/antoinemadec/FixCursorHold.nvim/";
  });

  FTerm-nvim = buildVimPluginFrom2Nix ({
    pname = "FTerm-nvim";
    version = "2021-06-17";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "FTerm.nvim";
      rev = "58d96ca4f3a25b01b8159b64a2f1d143320184a5";
      sha256 = "18ylh1rjh1pqi7yxwr3rk3si00m2d60dxqq1qgd2vvgpllmay40a";
    };

    meta.homepage = "https://github.com/numtostr/FTerm.nvim/";
  });

  indent-guides-nvim = buildVimPluginFrom2Nix ({
    pname = "indent-guides-nvim";
    version = "2021-03-26";
    src = fetchFromGitHub {
      owner = "glepnir";
      repo = "indent-guides.nvim";
      rev = "e261e5a43b5a05557a66b760a4132a6c502cc0e4";
      sha256 = "1wvbnsfcl2g4mwzy3c8r08rzywh6wdcpj6p8sh4fqcx2qsixjj55";
    };

    meta.homepage = "https://github.com/glepnir/indent-guides.nvim/";
  });

  detectindent = buildVimPluginFrom2Nix ({
    pname = "detectindent";
    version = "2015-03-09";
    src = fetchFromGitHub {
      owner = "ciaranm";
      repo = "detectindent";
      rev = "c09ab6effc29ef913c531816eb980460f8dc9ed2";
      sha256 = "035mnx8i002v7al3k89cmv3f9p38l42ix1v3hhxirqnx445iv2p2";
    };

    meta.homepage = "https://github.com/ciaranm/detectindent/";
  });

  diffconflicts = buildVimPluginFrom2Nix ({
    pname = "diffconflicts";
    version = "2020-12-08";
    src = fetchFromGitHub {
      owner = "whiteinge";
      repo = "diffconflicts";
      rev = "69e94953f2d237cdbe1981788e403dde71b3610b";
      sha256 = "0dbzj4vqdjw0zix8ksqv5mgd24fx4liv0lawm0m5agvyyzaz5zql";
    };

    meta.homepage = "https://github.com/whiteinge/diffconflicts/";
  });

  vim-bitbake = buildVimPluginFrom2Nix ({
    pname = "vim-bitbake";

    version = "2020-09-14";
    src = fetchFromGitHub {
      owner = "kergoth";
      repo = "vim-bitbake";
      rev = "6d4148c3d200265293040a18c2f772340566554b";
      sha256 = "108m3ajjjwmldw0grcrp8wyavqyk72jqbf653gd5gh18g394q4iq";
    };

    meta.homepage = "https://github.com/kergoth/vim-bitbake";
  });

  vim-boxdraw = buildVimPluginFrom2Nix ({
    pname = "vim-boxdraw";
    version = "2021-03-25";

    # TODO: use upstream and use patches
    src = fetchFromGitHub {
      owner = "michaeladler";
      repo = "vim-boxdraw";
      rev = "3f51e6a0801536fa6579b0bbca89b34af0c7cdbd";
      sha256 = "1l5wznmm1kjcm2fkx009hgwbsfx3xv8cy1jwws7jfp1r9gr7jnfv";
    };
    meta.homepage = "https://github.com/gyim/vim-boxdraw";
  });

  vim-enmasse = buildVimPluginFrom2Nix ({
    pname = "vim-enmasse";
    version = "2018-04-03";

    src = fetchFromGitHub {
      owner = "Olical";
      repo = "vim-enmasse";
      rev = "c2286f1d7bd735287a661cd223cd94e2a1f74deb";
      sha256 = "00c223zv9q9ir16irjcv8b8vyzfgal713mqnkawl5x187q52kqvq";
    };

    meta.homepage = "https://github.com/Olical/vim-enmasse";
  });

  vim-spellsync = buildVimPluginFrom2Nix ({
    pname = "vim-spellsync";
    version = "2018-09-18";

    src = fetchFromGitHub {
      owner = "micarmst";
      repo = "vim-spellsync";
      rev = "42c22cb3190297ef43a96eff27811ecafc92ee88";
      sha256 = "00ri85k2zk9d1gp1b5gvmk5f208nqn0dikfdgw6yxn0bzdf2ib58";
    };

    meta.homepage = "https://github.com/micarmst/vim-spellsync";
  });

}
