{ buildFirefoxXpiAddon, fetchurl, lib, stdenv }:
  {
    "dracula-dark-colorscheme" = buildFirefoxXpiAddon {
      pname = "dracula-dark-colorscheme";
      version = "1.9.1";
      addonId = "{b743f56d-1cc1-4048-8ba6-f9c2ab7aa54d}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3554827/dracula_dark_theme-1.9.1-an+fx.xpi";
      sha256 = "0967d0999c32c299a9bdd4aae49cec068e748caaebcae37951b86fa0bd65c7fd";
      meta = with lib;
      {
        homepage = "https://draculatheme.com/firefox";
        description = "Official Dracula theme for firefox.";
        license = licenses.cc-by-nc-sa-30;
        platforms = platforms.all;
        };
      };
    }
