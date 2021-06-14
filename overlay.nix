final: prev:

let
  fetchFromGitHub = prev.fetchFromGitHub;
  callPackage = prev.callPackage;
in

rec {

  neomutt = callPackage ./pkgs/neomutt { };
  neovim-unwrapped = callPackage ./pkgs/neovim/unwrapped.nix { orig = prev.neovim-unwrapped; };

  zsh-autosuggestions = callPackage ./pkgs/zsh-plugins/zsh-autosuggestions { orig = prev.zsh-autosuggestions; };
  zsh-fast-syntax-highlighting = callPackage ./pkgs/zsh-plugins/zsh-fast-syntax-highlighting { orig = prev.zsh-fast-syntax-highlighting; };
  zsh-syntax-highlighting = callPackage ./pkgs/zsh-plugins/zsh-syntax-highlighting { orig = prev.zsh-syntax-highlighting; };
  zsh-pandoc-completion = callPackage ./pkgs/zsh-plugins/zsh-pandoc-completion { };
  zsh-vi-mode = callPackage ./pkgs/zsh-plugins/zsh-vi-mode { };

  zig = callPackage ./pkgs/zig { };
  zls = callPackage ./pkgs/zls { };

  dwm = callPackage ./pkgs/dwm { orig = prev.dwm; };
  dwmblocks = callPackage ./pkgs/dwmblocks { orig = prev.dwmblocks; };
  st = callPackage ./pkgs/st { orig = prev.st; };

  luaprompt = callPackage ./pkgs/luaprompt { };
  vcalendar-filter = callPackage ./pkgs/vcalendar-filter { };
  afew = callPackage ./pkgs/afew { orig = prev.afew; };
  nix-direnv = callPackage ./pkgs/nix-direnv { orig = prev.nix-direnv; };
  zzz = callPackage ./pkgs/zzz { };
  oelint-adv = callPackage ./pkgs/oelint-adv { };

  tmuxPlugins = prev.tmuxPlugins // (callPackage ./pkgs/tmux-plugins { orig = prev.tmuxPlugins; });
  vimPlugins = prev.vimPlugins // (prev.recurseIntoAttrs (callPackage ./pkgs/vim-plugins { orig = prev.vimPlugins; }));

}
