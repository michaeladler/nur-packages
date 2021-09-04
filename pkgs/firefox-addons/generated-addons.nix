{ buildFirefoxXpiAddon, fetchurl, lib, stdenv }:
  {
    "dracula-dark-colorscheme" = buildFirefoxXpiAddon {
      pname = "dracula-dark-colorscheme";
      version = "1.9.2";
      addonId = "{b743f56d-1cc1-4048-8ba6-f9c2ab7aa54d}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3834855/dracula_dark_theme-1.9.2-an+fx.xpi";
      sha256 = "785c5dec67c27991dc19e32a1ed62199acf7ee0dc3f65461b22926e1d65aebda";
      meta = with lib;
      {
        homepage = "https://draculatheme.com/firefox";
        description = "Official Dracula theme for firefox.";
        license = licenses.cc-by-nc-sa-30;
        platforms = platforms.all;
        };
      };
    }