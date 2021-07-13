final: prev:

let
  inherit (prev.vimUtils.override { inherit (prev.vim); }) buildVimPluginFrom2Nix;
  fetchFromGitHub = prev.fetchFromGitHub;
in

{

  barbar-nvim = prev.vimPlugins.barbar-nvim.overrideAttrs (old: {
    version = "2021-06-12";
    src = fetchFromGitHub {
      owner = "romgrk";
      repo = "barbar.nvim";
      rev = "33639e53d0bf69444275ed048c5bfd7e29396634";
      sha256 = "0zqc4j0nbdhap8a67529n2k4k53xnqxrjsn2a4sdqdwvm207y6r9";
    };
  });

  friendly-snippets = prev.vimPlugins.friendly-snippets.overrideAttrs (old: {
    version = "2021-07-08";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "f3ca66b6a2a42eb01ffc255ac03039177b888951";
      sha256 = "08wzq5i86wxdyhl2yrl9ggfhng92pfx5d7rhmxfcm4abnnl9sj07";
    };
  });

  nvim-compe = prev.vimPlugins.nvim-compe.overrideAttrs (old: {
    version = "2021-07-12";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-compe";
      rev = "d35f5fcece6dc44d28646dbb9c6184eaeec82c8f";
      sha256 = "07hdsnjj65zvn7al1wq1hncmvxzyvnxacp4v5g2frk24ill1bzy6";
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
    version = "2021-07-13";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "bc7796a5fd8a9c0373413105f0fbd5ea44583538";
      sha256 = "0qz8pqbj9ijd1qp16fqr4q7fpdjb6j0574q8bsp3lg3x8355skzy";
    };
  });

  nvim-peekup = prev.vimPlugins.nvim-peekup.overrideAttrs (old: {
    version = "2021-07-05";
    src = fetchFromGitHub {
      owner = "gennaro-tedesco";
      repo = "nvim-peekup";
      rev = "e8ad8c7160e1f8ed2a7e4e071110b8b18866b463";
      sha256 = "1kjvz2hv05a2id72xi28n1iq7cclcvy3ql74h8f0vcpn10zqvfxx";
    };
  });

  nvim-treesitter = prev.vimPlugins.nvim-treesitter.overrideAttrs (old: {
    version = "2021-07-11";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "647268183f8eb164bf8c94ec1c87634f51f5c34a";
      sha256 = "1xf4px6vsxm623dvj7jgd0i73k1a9k5rq7jjz7azd0mv54dm5hbj";
    };
  });

  nvim-treesitter-refactor = prev.vimPlugins.nvim-treesitter-refactor.overrideAttrs (old: {
    version = "2021-07-05";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-refactor";
      rev = "505e58a8b04596a073b326157490706ee63c3b81";
      sha256 = "0z42rpnig6iq73d3mjfgadvqa03k02f4c89j5dp9dhpnrjja8nha";
    };
  });

  nvim-treesitter-textobjects = prev.vimPlugins.nvim-treesitter-textobjects.overrideAttrs (old: {
    version = "2021-07-08";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "379bc8f48256c07139241e1c7a70f22dd4344c4f";
      sha256 = "0bmy6rzmh3jfqd567wiavwfm9j2dpb0asmcgkyvj5j5qy2xfmi5l";
    };
  });

  plenary-nvim = prev.vimPlugins.plenary-nvim.overrideAttrs (old: {
    version = "2021-07-12";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "8bae2c1fadc9ed5bfcfb5ecbd0c0c4d7d40cb974";
      sha256 = "1axvjv6n77afkjqk914dpc020kxd7mig6m5sr916k1n1q35jc4ny";
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

  telescope-nvim = prev.vimPlugins.telescope-nvim.overrideAttrs (old: {
    version = "2021-07-12";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "5692edd004fed1dbd55c90775c34a051298724e7";
      sha256 = "0mzgbnm9ic173spnm9w9da7yl79fqg6p7s1sv0w3d3m7qqvz0bpz";
    };
  });

  vim-vsnip = prev.vimPlugins.vim-vsnip.overrideAttrs (old: {
    version = "2021-07-05";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "vim-vsnip";
      rev = "d9d3c2d2942b8e35aedc5c82552913b19958de77";
      sha256 = "06hv1rf3br32n6ks5fic8x9c1m32n3wx4pj4xgmy9q58gf95sn2w";
    };
  });

  neogit = prev.vimPlugins.neogit.overrideAttrs (old: {
    version = "2021-07-12";
    src = fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "90b1901774c11b86f3d36f7d17803125bfbe82b8";
      sha256 = "1fi4dajrhrsfj64bxz9vpd2ipsjnsx51sqc34qg0iw47qraw8yij";
    };
  });

  diffview-nvim = prev.vimPlugins.diffview-nvim.overrideAttrs (old: {
    version = "2021-07-04";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "1936824f5986c986befad5995e7bf87ba124d109";
      sha256 = "16h82yn7g9jq2chdb4wjjvz6akb0r06wjjvqpj9xkp82rx55m4ix";
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
    version = "2021-07-12";
    src = fetchFromGitHub {
      owner = "numtostr";
      repo = "FTerm.nvim";
      rev = "024c76c577718028c4dd5a670552117eef73e69a";
      sha256 = "1vf5wa9jgc5kbxwpx34zld92wm6vz0rj84kc2shnxnpwdk9sg1is";
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

  lualine-nvim = buildVimPluginFrom2Nix ({
    pname = "lualine-nvim";
    version = "2021-05-27";
    src = fetchFromGitHub {
      owner = "hoob3rt";
      repo = "lualine.nvim";
      rev = "9726824f1dcc8907632bc7c32f9882f26340f815";
      sha256 = "0gmbv0pbswkxjd4qw7dq66gp3fj594di0pgkb47yh3b46id8vkyj";
    };

    dependencies = [ final.vimPlugins.nvim-web-devicons ];

    meta.homepage = "https://github.com/hoob3rt/lualine.nvim";
  });

  vim-nightfly-guicolors = buildVimPluginFrom2Nix ({
    pname = "vim-nightfly-guicolors";
    version = "2021-07-11";
    src = fetchFromGitHub {
      owner = "bluz71";
      repo = "vim-nightfly-guicolors";
      rev = "1c238496f7cf8d2546c53d81a5a94f7ff9bc3027";
      sha256 = "1kkh1gggxhl2vs9cy4ldffv4wnw98qg0xh8pzcibk89ykag8nxby";
    };

    meta.homepage = "https://github.com/bluz71/vim-nightfly-guicolors";
  });

  doom-one-vim = buildVimPluginFrom2Nix ({
    pname = "doom-one-vim";
    version = "2021-05-18";
    src = fetchFromGitHub {
      owner = "romgrk";
      repo = "doom-one.vim";
      rev = "80bba63483d33a0cfa270219e990e26919b3a87f";
      sha256 = "16icxzm01lfilyr3h1dl1bv2rwsajp55ay018273inkbva5ycxza";
    };

    meta.homepage = "https://github.com/romgrk/doom-one.vim";
  });

  vim-buftabline = buildVimPluginFrom2Nix ({
    pname = "vim-buftabline";
    version = "2020-12-13";
    src = fetchFromGitHub {
      owner = "ap";
      repo = "vim-buftabline";
      rev = "73b9ef5dcb6cdf6488bc88adb382f20bc3e3262a";
      sha256 = "06xv5024lfnvjzxwggiaga01rxkm12rffps7fipqj3drgyd6mxsv";
      fetchSubmodules = true;
    };

    meta.homepage = "https://github.com/ap/vim-buftabline";
  });

  tokyonight-nvim = buildVimPluginFrom2Nix ({
    pname = "tokyonight-nvim";
    version = "2021-07-09";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "tokyonight.nvim";
      rev = "e3ad6032a7e2c54dd7500335b43c7d353a19ede9";
      sha256 = "1slb67kirb0jfgjsw09dhimmxagsk2aii6w461y1w8nj3fkl6p28";
    };

    meta.homepage = "https://github.com/folke/tokyonight.nvim";
    meta.license = prev.lib.licenses.mit;
  });

}
