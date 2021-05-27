{ sources, lib, fetchFromGitHub, pkgs, stdenv }:

let
  rtpPath = "share/tmux-plugins";

  addRtp = path: rtpFilePath: attrs: derivation:
    derivation // {
      rtp = "${derivation}/${path}/${rtpFilePath}";
    } // {
      overrideAttrs = f: mkTmuxPlugin (attrs // f attrs);
    };

  mkTmuxPlugin = a@{ pluginName, rtpFilePath ?
      (builtins.replaceStrings [ "-" ] [ "_" ] pluginName) + ".tmux"
    , namePrefix ? "tmuxplugin-", src, unpackPhase ? "", configurePhase ? ":"
    , buildPhase ? ":", addonInfo ? null, preInstall ? "", postInstall ? ""
    , path ? lib.getName pluginName, buildInputs ? [ ], ... }:
    if lib.hasAttr "dependencies" a then
      throw
      "dependencies attribute is obselete. see NixOS/nixpkgs#118034" # added 2021-04-01
    else
      addRtp "${rtpPath}/${path}" rtpFilePath a (stdenv.mkDerivation (a // {
        pname = namePrefix + pluginName;

        inherit pluginName unpackPhase configurePhase buildPhase addonInfo
          preInstall postInstall buildInputs;

        installPhase = ''
          runHook preInstall

          target=$out/${rtpPath}/${path}
          mkdir -p $out/${rtpPath}
          cp -r . $target
          if [ -n "$addonInfo" ]; then
            echo "$addonInfo" > $target/addon-info.json
          fi

          runHook postInstall
        '';
      }));

in rec {

  continuum = mkTmuxPlugin (let src = sources.tmux-continuum-src;
  in {
    inherit src;
    pluginName = "continuum";
    version = toString src.lastModifiedDate;
    meta = {
      homepage = "https://github.com/tmux-plugins/tmux-continuum";
      description = "continous saving of tmux environment";
      longDescription = ''
        Features:
        * continuous saving of tmux environment
        * automatic tmux start when computer/server is turned on
        * automatic restore when tmux is started

        Together, these features enable uninterrupted tmux usage. No matter the
        computer or server restarts, if the machine is on, tmux will be there how
        you left it off the last time it was used.
      '';
      license = lib.licenses.mit;
      platforms = lib.platforms.unix;
      maintainers = with lib.maintainers; [ ronanmacf ];
    };
  });

  copycat = mkTmuxPlugin (let src = sources.tmux-copycat-src;
  in {
    inherit src;
    pluginName = "copycat";
    version = toString src.lastModifiedDate;
  });

  dracula = mkTmuxPlugin (let src = sources.tmux-dracula-src;
  in {
    inherit src;
    pluginName = "dracula";
    version = toString src.lastModifiedDate;
    meta = with lib; {
      homepage = "https://draculatheme.com/tmux";
      description = "A feature packed Dracula theme for tmux!";
      license = licenses.mit;
      platforms = platforms.unix;
      maintainers = with maintainers; [ ethancedwards8 ];
    };
  });

  open = mkTmuxPlugin (let src = sources.tmux-open-src;
  in {
    inherit src;
    pluginName = "open";
    version = toString src.lastModifiedDate;
  });

  resurrect = mkTmuxPlugin (let src = sources.tmux-resurrect-src;
  in {
    inherit src;
    pluginName = "resurrect";
    version = toString src.lastModifiedDate;

    patches = [
      ./patches/tmux-resurrect/0001-linux_procfs-Improve-COMMAND_PID-detection.patch
      ./patches/tmux-resurrect/0002-Support-for-binary-strategy-files.patch
    ];

    meta = {
      homepage = "https://github.com/tmux-plugins/tmux-resurrect";
      description = "Restore tmux environment after system restart";
      longDescription = ''
        This plugin goes to great lengths to save and restore all the details
        from your tmux environment. Here's what's been taken care of:

        * all sessions, windows, panes and their order
        * current working directory for each pane
        * exact pane layouts within windows (even when zoomed)
        * active and alternative session
        * active and alternative window for each session
        * windows with focus
        * active pane for each window
        * "grouped sessions" (useful feature when using tmux with multiple monitors)
        * programs running within a pane! More details in the restoring programs doc.

        Optional:
        * restoring vim and neovim sessions
        * restoring pane contents
      '';
      license = lib.licenses.mit;
      platforms = lib.platforms.unix;
      maintainers = with lib.maintainers; [ ronanmacf ];
    };
  });

  sensible = mkTmuxPlugin (let src = sources.tmux-sensible-src;
  in {
    inherit src;
    pluginName = "sensible";
    version = toString src.lastModifiedDate;
    postInstall = lib.optionalString stdenv.isDarwin ''
      sed -e 's:reattach-to-user-namespace:${pkgs.reattach-to-user-namespace}/bin/reattach-to-user-namespace:g' -i $target/sensible.tmux
    '';
  });

  sessionist = mkTmuxPlugin (let src = sources.tmux-sessionist-src;
  in {
    inherit src;
    pluginName = "sessionist";
    version = toString src.lastModifiedDate;
  });

  tilish = mkTmuxPlugin (let src = sources.tmux-tilish-src;
  in {
    inherit src;
    pluginName = "tilish";
    version = toString src.lastModifiedDate;

    meta = with lib; {
      homepage = "https://github.com/jabirali/tmux-tilish";
      description = "Plugin which makes tmux work and feel like i3wm";
      license = licenses.mit;
      platforms = platforms.unix;
      maintainers = with maintainers; [ arnarg ];
    };
  });

  vim-tmux-navigator = mkTmuxPlugin (let src = sources.vim-tmux-navigator-src;
  in {
    inherit src;
    version = toString src.lastModifiedDate;
    pluginName = "vim-tmux-navigator";
    rtpFilePath = "vim-tmux-navigator.tmux";
  });

  yank = mkTmuxPlugin (let src = sources.tmux-yank-src;
  in {
    inherit src;
    version = toString src.lastModifiedDate;
    pluginName = "yank";
  });

  tmux-fzf = mkTmuxPlugin (let src = sources.tmux-fzf-src;
  in {
    inherit src;
    version = toString src.lastModifiedDate;
    pluginName = "tmux-fzf";
    rtpFilePath = "main.tmux";
    postInstall = ''
      find $target -type f -print0 | xargs -0 sed -i -e 's|fzf |${pkgs.fzf}/bin/fzf |g'
      find $target -type f -print0 | xargs -0 sed -i -e 's|sed |${pkgs.gnused}/bin/sed |g'
      find $target -type f -print0 | xargs -0 sed -i -e 's|tput |${pkgs.ncurses}/bin/tput |g'
    '';
    meta = {
      homepage = "https://github.com/sainnhe/tmux-fzf";
      description = "Use fzf to manage your tmux work environment! ";
      longDescription = ''
        Features:
        * Manage sessions (attach, detach*, rename, kill*).
        * Manage windows (switch, link, move, swap, rename, kill*).
        * Manage panes (switch, break, join*, swap, layout, kill*, resize).
        * Multiple selection (support for actions marked by *).
        * Search commands and append to command prompt.
        * Search key bindings and execute.
        * User menu.
        * Popup window support.
      '';
      license = lib.licenses.mit;
      platforms = lib.platforms.unix;
      maintainers = with lib.maintainers; [ kyleondy ];
    };
  });
}
