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
    version = "unstable-2021-08-26";
    src = fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "45ace6d27ffdb81ef423d6c0e1643d547b0e7cbe";
      sha256 = "1xbi0zrqrnv5vf927cx3fi2bfrf9v58nqc9460i9xmw0a3d7prkg";
    };
  });

  nvim-compe = prev.vimPlugins.nvim-compe.overrideAttrs (old: {
    version = "unstable-2021-08-25";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "nvim-compe";
      rev = "dc39f945e54b4547c998dc9e686df419d1077b60";
      sha256 = "0dc6nkx5648z96hgycins4gpagl4j4400vpgsqrlhk70d09q8w06";
    };
  });

  nvim-lightbulb = prev.vimPlugins.nvim-lightbulb.overrideAttrs (old: {
    version = "unstable-2021-08-21";
    src = fetchFromGitHub {
      owner = "kosayoda";
      repo = "nvim-lightbulb";
      rev = "e94e434f4549c9c331f875931b3e804fb1d2bc16";
      sha256 = "0043vzjp4p48xw03xn9g5l0daplg3rfijqxdq00kp0s6np3c312j";
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
    version = "unstable-2021-05-20";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "lsp-status.nvim";
      rev = "54c395248539d65fddda46f7d92e3421856874c1";
      sha256 = "1qfrfckdbqyav8l1g7lwpjrrwh559nm71ki74qd1xd18y1h63ny2";
    };
  });

  nvim-lspconfig = prev.vimPlugins.nvim-lspconfig.overrideAttrs (old: {
    version = "unstable-2021-08-26";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "7c5ce01c20adb707ca9f13f3a60d1d3915905bc3";
      sha256 = "1w2pa6svbwxrp3f5k7z748ha9wnb8m59zdbqi5si4333pxz6cm12";
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
    version = "unstable-2021-08-26";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter";
      rev = "1e4c846d01561821a737d08a6a5e2ac16d19c332";
      sha256 = "0cl2h599i4xmvgm4k8cliiz43qz6xnirh1zb8sfibdnw0fbqfpa5";
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
    version = "unstable-2021-08-22";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "531b5d4b808960fbcd5419a52c15f7753d074e2e";
      sha256 = "1fqnal3bggxadbx3zz9rj4m7q2md82ca5qljfcakg6b1syj6gvnx";
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
    version = "unstable-2021-08-19";
    src = fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "15c3cb9e6311dc1a875eacb9fc8df69ca48d7402";
      sha256 = "0gdysws82vdcyfsfpkpg9wqw223vg6hh74pf821wxh8p6qg3r26m";
    };
  });

  telescope-nvim = prev.vimPlugins.telescope-nvim.overrideAttrs (old: {
    version = "unstable-2021-08-26";
    src = fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "dcee6c81f4cd5f9bc4a4cea782135a0669aa74bd";
      sha256 = "0d5hs640mcvsca97p8sxj35hr7vfjq842lra0ymnhl6smk1vknbx";
    };
  });

  vim-vsnip = prev.vimPlugins.vim-vsnip.overrideAttrs (old: {
    version = "unstable-2021-08-15";
    src = fetchFromGitHub {
      owner = "hrsh7th";
      repo = "vim-vsnip";
      rev = "87d144b7451deb3ab55f1a3e3c5124cfab2b02fa";
      sha256 = "17gw992xvxsa6wyirah17xbsdi2gl4lif8ibvbs7dwagnkv01vyb";
    };
  });

  neogit = prev.vimPlugins.neogit.overrideAttrs (old: {
    version = "unstable-2021-08-21";
    src = fetchFromGitHub {
      owner = "TimUntersberger";
      repo = "neogit";
      rev = "06000011b9a8b1f2f843489c32afdb487e163c14";
      sha256 = "1qy7w190z3zvmb04pybcgxkc75hkivkj8msksbw1xlyhj7n9vz9h";
    };
  });

  diffview-nvim = prev.vimPlugins.diffview-nvim.overrideAttrs (old: {
    version = "unstable-2021-08-20";
    src = fetchFromGitHub {
      owner = "sindrets";
      repo = "diffview.nvim";
      rev = "e0ffb1cb7c5ea9e693e5ee5ee3ce1e5f78916ed6";
      sha256 = "1s3j2hdswrvw0vj6qycxyh71zg24b38anxr59ragq0hjm05zddb1";
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
    version = "unstable-2021-07-12";
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
    version = "unstable-2021-08-04";
    src = fetchFromGitHub {
      owner = "NoahTheDuke";
      repo = "vim-just";
      rev = "3d41a4c6f0f241549e33ba0b7eaf907060855910";
      sha256 = "18i9prhh9k47m1xxw2w3z83lf60qx6hwl0krnwz8c9vfc01xj5rw";
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
    version = "unstable-2021-03-17";
    src = fetchFromGitHub {
      owner = "pappasam";
      repo = "papercolor-theme-slim";
      rev = "642a52947c6233129e56ac1f2c9e551f4b81acc1";
      sha256 = "1334fvcr0daqqwsr758slhh10cbxvpx3n9p42n25nbham7biqzhg";
    };

    meta.homepage = "https://github.com/pappasam/papercolor-theme-slim";
  });

}
