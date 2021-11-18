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
    version = "unstable-2021-11-12";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "05bfa7681b8f11b664fab657001c2efb6f3ec85e";
      sha256 = "1133f32q4g990mmvdrbnjxggk8y96w0c5zlvh553cz9j626a4zks";
    };
  });

  nvim-cmp = prev.vimPlugins.nvim-compe.overrideAttrs (old: {
    version = "unstable-2021-11-18";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-cmp";
      rev = "56ad7c9158cb79db204ebb3d173a9656d6adce70";
      sha256 = "0g2bza2qasbns4y1gcrzn998dc0vyi7kgz02mbx4i9kzm9pg3lpc";
    };
  });

  nvim-lightbulb = prev.vimPlugins.nvim-lightbulb.overrideAttrs (old: {
    version = "unstable-2021-11-12";
    src = fetchFromGitHub {
      owner = "kosayoda";
      repo = "nvim-lightbulb";
      rev = "cd5267d2d708e908dbd668c7de74e1325eb1e1da";
      sha256 = "1ans2kzg750d4a83hk5p9x5h51m9ywxgk6bxrcj1pwnpkhl5h75z";
    };
  });

  lspkind-nvim = prev.vimPlugins.lspkind-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-25";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind-nvim";
      rev = "1557ce5b3b8e497c1cb1d0b9d967a873136b0c23";
      sha256 = "0qrfrwd7mz311hjmpkjfjg1d2dkar675vflizpj0p09b5dp8zkbv";
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
    version = "unstable-2021-11-16";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "27d2c116fdea5614f422dcbcae63da01a1415fcf";
      sha256 = "10ip201ihd2jjs9mb0vafa7iqzxh0f0rs5s96rrpw4zaxzq49gkn";
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
    version = "unstable-2021-11-16";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "d78fb79ed6f3e5260db48f352d8dcbd3e82935a3";
      sha256 = "0ngq5c2qhg8aj83dhp6m4cw6piaggczcadpsxfj3wpgr3sdmqq68";
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
    version = "unstable-2021-11-03";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "31cfd4221b2729a7d4e60a6f1bb506b17af60e87";
      sha256 = "1956yi7mjsx5ir7szdiz0kgxylv8zgs4g509rzsca1nz9qblr6j4";
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
    version = "unstable-2021-11-14";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "1c31adb35fcebe921f65e5c6ff6d5481fa5fa5ac";
      sha256 = "075b6ak0hl3wqhsy1qmi91s30lh6p6vpbvqllzvyhlz3pxabh314";
    };
  });

  telescope-nvim = prev.vimPlugins.telescope-nvim.overrideAttrs (old: {
    version = "unstable-2021-11-15";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "9ac89ebf6755e9a3f4bae86625ec76106526e57b";
      sha256 = "0bljlg2hwa531rp53hwx1w06awksbhxl4lm672rn74sfaxqnzv87";
    };
  });

  vim-vsnip = prev.vimPlugins.vim-vsnip.overrideAttrs (old: {
    version = "unstable-2021-11-15";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "vim-vsnip";
      rev = "60ee20318550f4a5b6f7a5a8b827540c2c386898";
      sha256 = "0gl34m17pxgyfbdqghhfcgxhbhxwvjc9r048sim1gf86wga4mq39";
    };
  });

  neogit = prev.vimPlugins.neogit.overrideAttrs (old: {
    version = "unstable-2021-11-09";
    src = fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "807e4a795dc6c2383b281fc27bd1bc6c197d98cd";
      sha256 = "126kdn9dfvk0ggzh00439zwrq1jldnxvk0nsf7g371qkbbnc4qal";
    };
  });

  diffview-nvim = prev.vimPlugins.diffview-nvim.overrideAttrs (old: {
    version = "unstable-2021-11-11";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "a38306ddf893b95b55c6cd881605b3232c658e42";
      sha256 = "1c55zhxzf3zps7fzqs4vsd81z9la2x3blvjwh45abs93rnqik8nx";
    };
  });

  null-ls-nvim = prev.vimPlugins.null-ls-nvim.overrideAttrs (old: {
    version = "unstable-2021-11-17";
    src = fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "0e58e1b57ae8751f3e1d58d45421cc0eac858f7a";
      sha256 = "043xl0hx8fah77fl4s6dnizkmmbzpc0lfnnahi90yf92hsxyf0d4";
    };
  });

  wilder-nvim = prev.vimPlugins.wilder-nvim.overrideAttrs (old: {
    version = "unstable-2021-10-31";
    src = fetchFromGitHub {
      owner = "gelguy";
      repo = "wilder.nvim";
      rev = "f7071a649e8eff744b36b055f02bbb952efc4cbb";
      sha256 = "0f3r9l2brk75qs9m8rn6sxlbmg80n51cmh7j3ss66k7al52xpphc";
    };

  });

  lightspeed-nvim = prev.vimPlugins.lightspeed-nvim.overrideAttrs (old: {
    version = "unstable-2021-11-17";
    src = fetchFromGitHub {
      owner = "ggandor";
      repo = "lightspeed.nvim";
      rev = "4bccedef0c9c81e6bdea0d486b35896dbc4dd346";
      sha256 = "19s58h6b6dip9cx8b96ngc1ndk1fx4zam9hmyha9scq0k3g997d7";
    };
  });

  orgmode-nvim = prev.vimPlugins.orgmode-nvim.overrideAttrs (old: {
    version = "unstable-2021-11-17";
    src = fetchFromGitHub {
      owner = "kristijanhusak";
      repo = "orgmode.nvim";
      rev = "012a7eb5e292311d26301b882193add0bf4c058b";
      sha256 = "1k78r7n4x3sfw97zna0kx1y0ycbdkzi0pk5x7j83vw8m8skvx5iw";
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

    version = "unstable-2021-11-02";
    src = fetchFromGitHub {
      owner = "antoinemadec";
      repo = "FixCursorHold.nvim";
      rev = "0e4e22d21975da60b0fd2d302285b3b603f9f71e";
      sha256 = "1qrf6ig1gbrbq6wrxqkabnqx6zqwjw7wqacl7q2ckw4sy6sam7mz";
    };

    meta.homepage = "https://github.com/antoinemadec/FixCursorHold.nvim/";
  });

  FTerm-nvim = buildVimPluginFrom2Nix ({
    pname = "FTerm-nvim";
    version = "unstable-2021-11-13";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "FTerm.nvim";
      rev = "0911ab93b488fdd8032e695ab56d14357e14e836";
      sha256 = "0pbfg66fd8ff1b2wshlb9c58sb8zq3ckm7yjg6vv43dk4kcnjf1i";
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
    version = "unstable-2021-11-16";
    src = fetchFromGitHub {
      owner = "hoob3rt";
      repo = "lualine.nvim";
      rev = "7b608cb5731087b157bd509103b1d82d8984cba4";
      sha256 = "04nbfml4j2yr4imvdzany4r6amakiwazgfjgd4y2h3c78pnlrb41";
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
    version = "unstable-2021-11-15";
    src = fetchFromGitHub {
      owner = "kazhala";
      repo = "close-buffers.nvim";
      rev = "3acbcad1211572342632a6c0151f839e7dead27f";
      sha256 = "0gncvn531grcgdmxismfp49dqprj2qjasb3h3xr3jagiwvqkffgy";
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
    version = "unstable-2021-11-05";
    src = fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "620445b87a0d1640fac6991f9c3338af8dec1884";
      sha256 = "1mw6862njjfpl3h4kaq9vkl1gddi4bdah2kzrijgq0gykiqkjpks";
    };

    meta.homepage = "https://github.com/numToStr/Comment.nvim";
  });

  stabilize-nvim = buildVimPluginFrom2Nix ({
    pname = "stabilize-nvim";
    version = "unstable-2021-11-13";
    src = fetchFromGitHub {
      owner = "luukvbaal";
      repo = "stabilize.nvim";
      rev = "0026672d4b6fc922bd6f80df9a2858ce1e8cc0ed";
      sha256 = "0667yh9yprym7vakm83x174srb2x2ch9q97137qlj28acks3wnqh";
    };

    meta.homepage = "https://github.com/luukvbaal/stabilize.nvim";
  });

  replacer-nvim = buildVimPluginFrom2Nix ({
    pname = "replacer-nvim";
    version = "unstable-2021-11-06";
    src = fetchFromGitHub {
      owner = "gabrielpoca";
      repo = "replacer.nvim";
      rev = "7fa79894c77d3236b1cef488acde220593113c0b";
      sha256 = "09hla957v3qvyln95l5lpvm9inb0mbp6cpjvnj8kfryhhljgm6b6";
    };

    meta.homepage = "https://github.com/gabrielpoca/replacer.nvim";
  });

  dracula-nvim = buildVimPluginFrom2Nix ({
    pname = "dracula.nvim";
    version = "unstable-2021-11-14";
    src = fetchFromGitHub {
      owner = "Mofiqul";
      repo = "dracula.nvim";
      rev = "b740001bcfe9754be7f72f4bfb2b3173098d05d3";
      sha256 = "07a381sj9phc7aj70crif2pq77cixiv59m7gyna9ad6fab0lnfl1";
    };

    meta.homepage = "https://github.com/Mofiqul/dracula.nvim";
  });

  solarized-nvim = buildVimPluginFrom2Nix ({
    pname = "solarized.nvim";
    version = "unstable-2021-11-10";
    src = fetchFromGitHub {
      owner = "shaunsingh";
      repo = "solarized.nvim";
      rev = "f3578ab3fa7bb40678dff60560faefb50a345f01";
      sha256 = "0dfz2cmscwvcasr8w04gk10wcg1rf79kk8wq5qlnp84vid15mnnl";
    };

    meta.homepage = "https://github.com/shaunsingh/solarized.nvim";
  });

  material-nvim = buildVimPluginFrom2Nix ({
    pname = "material.nvim";
    version = "unstable-2021-10-29";
    src = fetchFromGitHub {
      owner = "marko-cerovac";
      repo = "material.nvim";
      rev = "f62b22127c74db1de30b186c96d7dfc3ec35aed0";
      sha256 = "0agm2iw67b8dsnmhm1bx0q5a5x5c7bn0r76yyadm3qr5gv61a66x";
    };

    meta.homepage = "https://github.com/marko-cerovac/material.nvim";
  });

}
