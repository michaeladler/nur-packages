final: prev:

let
  inherit (prev.vimUtils.override { inherit (prev.vim); }) buildVimPluginFrom2Nix;
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  barbar-nvim = prev.vimPlugins.barbar-nvim.overrideAttrs (old: {
    version = "unstable-2021-08-15";
    src = fetchFromGitHub {
      owner = "romgrk";
      repo = "barbar.nvim";
      rev = "7a19aac3d401c997a6fb7067a7756a4a77184c2e";
      sha256 = "1jbbnd7s2kql44zv7xkv9hmyj0482yjnm57l8nl0kdf8b61zzi3s";
    };
  });

  friendly-snippets = prev.vimPlugins.friendly-snippets.overrideAttrs (old: {
    version = "unstable-2021-09-16";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "31cdf6ab00898ae80e2bfe870378a499697da725";
      sha256 = "0iafqh05h3v5bnvigrb6bnv0sn6lps64blqfnksr35i60yljw878";
    };
  });

  nvim-compe = prev.vimPlugins.nvim-compe.overrideAttrs (old: {
    version = "unstable-2021-09-08";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-compe";
      rev = "980357a9eeabe84f29c96d38421c9bff321a2bc8";
      sha256 = "1qh8axjfwc2dwdfvc9izfmzwy382vzg9jcnfzs8fkl7lqb87i3a0";
    };
  });

  nvim-lightbulb = prev.vimPlugins.nvim-lightbulb.overrideAttrs (old: {
    version = "unstable-2021-09-09";
    src = fetchFromGitHub {
      owner = "kosayoda";
      repo = "nvim-lightbulb";
      rev = "7411586f6b431a9c49a50fa962b6d6eae25aeb20";
      sha256 = "0maba6mzkpvnjdz8x0lifdqlbw55bd58ggavbhyxd8279887bph6";
    };
  });

  lspkind-nvim = prev.vimPlugins.lspkind-nvim.overrideAttrs (old: {
    version = "unstable-2021-08-19";
    src = fetchFromGitHub {
      owner = "onsails";
      repo = "lspkind-nvim";
      rev = "9cc326504e566f467407bae2669a98963c5404d2";
      sha256 = "0bbczy2hhdl79g749d41vv5fyfcdd3rsxhi8mbq6avc0vhw72m8c";
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
    version = "unstable-2021-09-16";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "aa0b9fd746d73a5ebbc72c732c645e96423d4504";
      sha256 = "01jgxf8bgra4sgh63zpb5xga9lyb3bvpqcdzjk3vp6gyks66fb6h";
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
    version = "unstable-2021-09-18";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "2dfe72f32a22df04758709645f043e06cd6c037c";
      sha256 = "07rjnrgfj5w0d76r9zy9jphqpvzg38aagqm5xy24sbd9dy9y0z6r";
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
    version = "unstable-2021-09-17";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "825a0185f8af72203d9980b08bdf8ffc92d097e3";
      sha256 = "1qa60ivl6a6l03n9j0x2kdzclwhwg2lidbrlfi88w24g4q9364v7";
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
    version = "unstable-2021-09-16";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "ce8f7fa999b5c091d3e7badcc2340df62b94abf9";
      sha256 = "0v7yidq75yhcghg7bz86r3r59aj6ls7n9w5dhj1s4zskbmqvr94h";
    };
  });

  telescope-nvim = prev.vimPlugins.telescope-nvim.overrideAttrs (old: {
    version = "unstable-2021-09-17";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "2e7584f1cfdffb32bf26039a050cd2cf74ede4cd";
      sha256 = "16gdsx9yv5kwg8girmf51l6wb4v2kzg5snc1d2lhilizhs35qzmw";
    };
  });

  vim-vsnip = prev.vimPlugins.vim-vsnip.overrideAttrs (old: {
    version = "unstable-2021-09-14";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "vim-vsnip";
      rev = "9ac8044206d32bea4dba34e77b6a3b7b87f65df6";
      sha256 = "0m488cfpl7yszyhgz12binrmxysa05wxypdgy83cdxb0npka20ff";
    };
  });

  neogit = prev.vimPlugins.neogit.overrideAttrs (old: {
    version = "unstable-2021-09-16";
    src = fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "28e652d110e7bda263bd4b0cb3c1484dce89cd93";
      sha256 = "0106iy1zkd13i26dviv6w8jgm9hapimpj97passh2khac3ajln5c";
    };
  });

  diffview-nvim = prev.vimPlugins.diffview-nvim.overrideAttrs (old: {
    version = "unstable-2021-09-08";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "520bb5c34dd24e70fc063d28bd6d0e8181bff118";
      sha256 = "0iz98b75alndxlgyabprk7vmgshqjiigmqmha5pjfw92z4g5lyw8";
    };
  });

  null-ls-nvim = prev.vimPlugins.null-ls-nvim.overrideAttrs (old: {
    version = "unstable-2021-09-17";
    src = fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "2c6a20434de6b1d09f76c20eea34e37e7432e06c";
      sha256 = "1z58wqvw8xslz9yzbrnmsjn0mdn9kpvrrv7hmydfc2a8vir55mlk";
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

    version = "unstable-2021-04-16";
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
    version = "unstable-2021-09-14";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "FTerm.nvim";
      rev = "ea77fa140914891cd02ccc445fbe70fc5c43e2a0";
      sha256 = "0p3y6a5v6hqifg1s89drybd4b0srgdj4pyiwvkp00kph9d23l7ra";
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

  vim-boxdraw = buildVimPluginFrom2Nix ({
    pname = "vim-boxdraw";
    version = "unstable-2021-01-28";

    src = fetchFromGitHub {
      owner = "gyim";
      repo = "vim-boxdraw";
      rev = "b7f789f305b1c5b0b4623585e0f10adb417f2966";
      sha256 = "0zr3r4dgpdadaz3g9hzn7vyv0rids0k1wdywk9yywfp6q9m0ygj8";
    };

    patches = [
      ./patches/vim-boxdraw/0001-UTF-8-style.patch
    ];

    meta.homepage = "https://github.com/gyim/vim-boxdraw";
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

}
