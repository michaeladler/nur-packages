final: prev:

let
  inherit (prev.vimUtils.override { inherit (prev.vim); }) buildVimPluginFrom2Nix;
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  barbar-nvim = prev.vimPlugins.barbar-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-04";
    src = fetchFromGitHub {
      owner = "romgrk";
      repo = "barbar.nvim";
      rev = "6e638309efcad2f308eb9c5eaccf6f62b794bbab";
      sha256 = "0kvhwn3gr5x5vf2cgjda22naf8cvgkc43zalvxvr99s9jcjyynki";
    };
  });

  friendly-snippets = prev.vimPlugins.friendly-snippets.overrideAttrs (old: {
    version = "unstable-2021-10-12";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "59507a9773ea1a24072342da357da0708b303ef9";
      sha256 = "1d5ragvg9jxs3axln3cqj7i37c0vxdyfwl4ll06yslghb77krf6w";
    };
  });

  nvim-compe = prev.vimPlugins.nvim-compe.overrideAttrs (old: {
    version = "unstable-2021-10-03";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-compe";
      rev = "d186d739c54823e0b010feb205c6f97792322c08";
      sha256 = "1cl3c4cazzpjj2wmsi42czrklzngzm82bbb9ivmcsa40rfz2lsk3";
    };
  });

  nvim-lightbulb = prev.vimPlugins.nvim-lightbulb.overrideAttrs (old: {
    version = "unstable-2021-10-16";
    src = fetchFromGitHub {
      owner = "kosayoda";
      repo = "nvim-lightbulb";
      rev = "66223954d7bd7d4358c36d157c25503168d04319";
      sha256 = "0jghq2fkvibilb1zglkckhpmq6dgi1q87fcwpvcv9slk1qlgw19d";
    };
  });

  lspkind-nvim = prev.vimPlugins.lspkind-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-11";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind-nvim";
      rev = "0f7851772ebdd5cb67a04b3d3cda5281a1eb83c1";
      sha256 = "0jk1xlp8x6vw40dl96zvmdxv0p8100rzx7za58xpahz10232lckx";
    };
  });

  lsp-status-nvim = prev.vimPlugins.lsp-status-nvim.overrideAttrs (old: {
    version = "unstable-2021-09-15";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "lsp-status.nvim";
      rev = "e8e5303f9ee3d8dc327c97891eaa1257ba5d4eee";
      sha256 = "106l23n01czd8ndzfixggj8ifv80w0n19mjakac575sjrxhwbl52";
    };
  });

  nvim-lspconfig = prev.vimPlugins.nvim-lspconfig.overrideAttrs (old: {
    version = "unstable-2021-10-17";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "7f902f952944aa708c78138f6536c0dc55aec3a2";
      sha256 = "1n8srlrfliak2587r30la87x3jgl9iq1x8jdxlhrx7i874ha3ykp";
    };
  });

  nvim-peekup = prev.vimPlugins.nvim-peekup.overrideAttrs (old: {
    version = "unstable-2021-07-05";
    src = fetchFromGitHub {
      owner = "gennaro-tedesco";
      repo = "nvim-peekup";
      rev = "e8ad8c7160e1f8ed2a7e4e071110b8b18866b463";
      sha256 = "1kjvz2hv05a2id72xi28n1iq7cclcvy3ql74h8f0vcpn10zqvfxx";
    };
  });

  nvim-treesitter = prev.vimPlugins.nvim-treesitter.overrideAttrs (old: {
    version = "unstable-2021-10-19";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "04db2e8295393844fce4151743747bdabdc844b8";
      sha256 = "0ldwfv8r2fy2qxhkbjq52jji6jbng26sycj49g58m25q3wnjpgbk";
    };
  });

  nvim-treesitter-refactor = prev.vimPlugins.nvim-treesitter-refactor.overrideAttrs (old: {
    version = "unstable-2021-07-05";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-refactor";
      rev = "505e58a8b04596a073b326157490706ee63c3b81";
      sha256 = "0z42rpnig6iq73d3mjfgadvqa03k02f4c89j5dp9dhpnrjja8nha";
    };
  });

  nvim-treesitter-textobjects = prev.vimPlugins.nvim-treesitter-textobjects.overrideAttrs (old: {
    version = "unstable-2021-10-19";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "ba9be1b0369d77c76ad09ea6f7048d55c3905e75";
      sha256 = "0qdnx62shnsblhhxwwz7m48ib4390l1vrlpkkwd4bk07lhcafdm3";
    };
  });

  popup-nvim = prev.vimPlugins.popup-nvim.overrideAttrs (old: {
    version = "unstable-2021-08-09";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "popup.nvim";
      rev = "f91d80973f80025d4ed00380f2e06c669dfda49d";
      sha256 = "1pp1d6kbx8yn4cg2zs8rynvvpa8y89ryr8rial9csg26v2z22z95";
    };
  });

  plenary-nvim = prev.vimPlugins.plenary-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-18";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "901b96d37a30be0504c97cc2c05d3a99b4cca842";
      sha256 = "14nkpj4x9213waqsy93sdgnll42s4dxxpq5kv6g8w015drjrbwhv";
    };
  });

  telescope-nvim = prev.vimPlugins.telescope-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-19";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "9cad3a4a5d0e36b07b25c4be1db1c1306fcec945";
      sha256 = "1zg6ps6dmab2agfhrvcqbmpz6pg10ywrqqdda1fk0sbxwxdx351p";
    };
  });

  vim-vsnip = prev.vimPlugins.vim-vsnip.overrideAttrs (old: {
    version = "unstable-2021-10-16";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "vim-vsnip";
      rev = "32ddc125ec6f5a07fe59b3ab6b4b5f50093102ee";
      sha256 = "0jis4zxs1fjczyj9c38mbicsnpyvxr4hlxg0292zk6qhmgwd8dd6";
    };
  });

  neogit = prev.vimPlugins.neogit.overrideAttrs (old: {
    version = "unstable-2021-10-12";
    src = fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "727652348bf4f39a354e88d1b2cbf36220d109db";
      sha256 = "07skmgl78vqks21lr64sm808zqbqf2013rf7ph9rkfz5wrn4zcvd";
    };
  });

  diffview-nvim = prev.vimPlugins.diffview-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-19";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "98c344c9f9a5c97f08b153cd8e9884197c8878d8";
      sha256 = "147561c78x93myp68c64hag7pb062gm565vba9j924mws5adgird";
    };
  });

  null-ls-nvim = prev.vimPlugins.null-ls-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-19";
    src = fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "bf15063e914aefb8b13de698be1a90d752c79c95";
      sha256 = "1lgffw0jpxdwp53gvg0k8pdh69wa1asdwv3k884n3bjg9jxpsb0q";
    };
  });

  wilder-nvim = prev.vimPlugins.wilder-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-11";
    src = fetchFromGitHub {
      owner = "gelguy";
      repo = "wilder.nvim";
      rev = "52ff550ef05a0110f4decc4629e0a58b94ca97b8";
      sha256 = "1xwn6jcgf1wbyzsm64n51m82xpy8s6k7yhyvd7c8byp2gbh7z0r8";
    };

  });

  lightspeed-nvim = prev.vimPlugins.lightspeed-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-18";
    src = fetchFromGitHub {
      owner = "ggandor";
      repo = "lightspeed.nvim";
      rev = "176ab1e0e5e9a044a36b38d2dc5db357c2add9b2";
      sha256 = "0bywrylff2igkk4r7vp67j5h58ixvpssbzxjgm59362khf2d78r8";
    };
  });

  ###############################################################################
  # the following plugins are not (yet) available in nixpkgs:
  ###############################################################################
  vim-ingo-library = buildVimPluginFrom2Nix ({
    pname = "vim-ingo-library";

    version = "unstable-2021-08-07";
    src = fetchFromGitHub {
      owner = "inkarkat";
      repo = "vim-ingo-library";
      rev = "51703e0f5fc73836b8e5be222f6eebde1891a664";
      sha256 = "0yk8dhjpxywh4vrxwvg3vjxdabl4i3qbd1qgk9bmb111bn7lwjnh";
    };

    meta.homepage = "https://github.com/inkarkat/vim-ingo-library/";
  });

  vim-SpellCheck = buildVimPluginFrom2Nix ({
    pname = "vim-SpellCheck";
    version = "unstable-2020-08-18";
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

    version = "unstable-2021-10-15";
    src = fetchFromGitHub {
      owner = "antoinemadec";
      repo = "FixCursorHold.nvim";
      rev = "f2572b0163d7b19b4e8a7c76a3eb084921d736de";
      sha256 = "06agspmka503yn75873kk0g5v2m91df1zblsh96gkc4h6wm52liv";
    };

    meta.homepage = "https://github.com/antoinemadec/FixCursorHold.nvim/";
  });

  FTerm-nvim = buildVimPluginFrom2Nix ({
    pname = "FTerm-nvim";
    version = "unstable-2021-10-04";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "FTerm.nvim";
      rev = "740c69fc0afd632a9b9a71763a88fef23070779f";
      sha256 = "15h6ddvl3wkis6z4c1r0h0vs5dlzhhp2mx0xrqvpvbws0w74gif1";
    };

    meta.homepage = "https://github.com/numtostr/FTerm.nvim/";
  });

  indent-guides-nvim = buildVimPluginFrom2Nix ({
    pname = "indent-guides-nvim";
    version = "unstable-2021-03-26";
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
    version = "unstable-2015-03-09";
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
    version = "unstable-2020-12-08";
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

    version = "unstable-2021-08-03";
    src = fetchFromGitHub {
      owner = "kergoth";
      repo = "vim-bitbake";
      rev = "15c3fd6877d7d321feb7e20257f05f21543ab33d";
      sha256 = "1n9qz23l65ajvjjd4m7bq9rpcw3xd23pdmryyn0kydgn8s3gmvx5";
    };

    meta.homepage = "https://github.com/kergoth/vim-bitbake";
  });

  vim-enmasse = buildVimPluginFrom2Nix ({
    pname = "vim-enmasse";
    version = "unstable-2018-04-03";

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
    version = "unstable-2018-09-18";

    src = fetchFromGitHub {
      owner = "micarmst";
      repo = "vim-spellsync";
      rev = "42c22cb3190297ef43a96eff27811ecafc92ee88";
      sha256 = "00ri85k2zk9d1gp1b5gvmk5f208nqn0dikfdgw6yxn0bzdf2ib58";
    };

    meta.homepage = "https://github.com/micarmst/vim-spellsync";
  });

  lualine-nvim = buildVimPluginFrom2Nix ({
    pname = "lualine-nvim";
    version = "unstable-2021-05-27";
    src = fetchFromGitHub {
      owner = "hoob3rt";
      repo = "lualine.nvim";
      rev = "9726824f1dcc8907632bc7c32f9882f26340f815";
      sha256 = "0gmbv0pbswkxjd4qw7dq66gp3fj594di0pgkb47yh3b46id8vkyj";
    };

    dependencies = [ final.vimPlugins.nvim-web-devicons ];

    meta.homepage = "https://github.com/hoob3rt/lualine.nvim";
  });

  vim-buftabline = buildVimPluginFrom2Nix ({
    pname = "vim-buftabline";
    version = "unstable-2020-12-13";
    src = fetchFromGitHub {
      owner = "ap";
      repo = "vim-buftabline";
      rev = "73b9ef5dcb6cdf6488bc88adb382f20bc3e3262a";
      sha256 = "06xv5024lfnvjzxwggiaga01rxkm12rffps7fipqj3drgyd6mxsv";
      fetchSubmodules = true;
    };

    meta.homepage = "https://github.com/ap/vim-buftabline";
  });

  vim-just = buildVimPluginFrom2Nix ({
    pname = "vim-just";
    version = "unstable-2021-08-28";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "312615d5b4c4aa2595d697faca5af345ba8fe102";
      sha256 = "05c2qdnrjvxshy48m0s6msvqq47n536p8c4dvf0j28hm39hqb8gj";
    };

    meta.homepage = "https://github.com/NoahTheDuke/vim-just";
  });

  close-buffers-nvim = buildVimPluginFrom2Nix ({
    pname = "close-buffers-nvim";
    version = "unstable-2021-08-10";
    src = fetchFromGitHub {
      owner = "kazhala";
      repo = "close-buffers.nvim";
      rev = "da77e7efd1491a2985e2db3b0927c9b5a6b16031";
      sha256 = "09azw4s37a6bpdi9rvvw8frjn3r8225a3jyrjsvhzfbflgpg3lb1";
    };

    meta.homepage = "https://github.com/kazhala/close-buffers.nvim";
  });

  papercolor-theme-slim = buildVimPluginFrom2Nix ({
    pname = "papercolor-theme-slim";
    version = "unstable-2021-09-14";
    src = fetchFromGitHub {
      owner = "pappasam";
      repo = "papercolor-theme-slim";
      rev = "a689f7c6f74671743f44fc109d2d78922896783c";
      sha256 = "0nn5z55jbsqr2i04jj1p4a6w8ai4jdxz7crph843mfpas7fnh0sa";
    };

    meta.homepage = "https://github.com/pappasam/papercolor-theme-slim";
  });

  venn-nvim = buildVimPluginFrom2Nix ({
    pname = "venn-nvim";
    version = "unstable-2021-10-20";
    src = fetchFromGitHub {
      owner = "jbyuki";
      repo = "venn.nvim";
      rev = "d5a9c73fe7772c11414fc52acbb1d1bdb1ebc70f";
      sha256 = "1mzxvx1vqnm89yzzy6n3s30y9w7s38lbjhnwdf4diy0kdzyq8x06";
    };

    meta.homepage = "https://github.com/jbyuki/venn.nvim";
  });

  comment-nvim = buildVimPluginFrom2Nix ({
    pname = "comment-nvim";
    version = "unstable-2021-10-19";
    src = fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "f90fd4b5b47e35c9cd911126fc5b88585919e7cc";
      sha256 = "0pii6fd6m2yzf3fxixmip471nqrb4dvsxygn71wiy7ldc8f6lw7n";
    };

    meta.homepage = "https://github.com/numToStr/Comment.nvim";
  });

  stabilize-nvim = buildVimPluginFrom2Nix ({
    pname = "stabilize-nvim";
    version = "unstable-2021-10-20";
    src = fetchFromGitHub {
      owner = "luukvbaal";
      repo = "stabilize.nvim";
      rev = "4e367db3f38d09e097973362e7497a1a671e2f8e";
      sha256 = "0rds612np4rn32v8gavhvbn1ni8mvnccbm9g4w3vy9r49iwg2xdi";
    };

    meta.homepage = "https://github.com/luukvbaal/stabilize.nvim";
  });

  replacer-nvim = buildVimPluginFrom2Nix ({
    pname = "replacer-nvim";
    version = "unstable-2021-09-03";
    src = fetchFromGitHub {
      owner = "gabrielpoca";
      repo = "replacer.nvim";
      rev = "2dd6fc14c2f9bbc1edc24958609f7f3405a0df41";
      sha256 = "0j51shpdrsfjifk5k28myffik03vbz7ils1gcn70jgi3lby8vv4w";
    };

    meta.homepage = "https://github.com/gabrielpoca/replacer.nvim";
  });

}
