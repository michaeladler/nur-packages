{ src, pkgs, fetchFromGitHub, harfbuzz, glibcLocales, makeWrapper }:

pkgs.st.overrideAttrs (old: {
  inherit src;
  version = toString src.lastModifiedDate;

  buildInputs = old.buildInputs ++ [ harfbuzz ];

  nativeBuildInputs = old.nativeBuildInputs ++ [ makeWrapper ];

  postPatch = ''
    # skip terminfo which conflicts with ncurses
    sed -i '/tic /d' Makefile
  '';

  preInstall = ''
    sed -i -e 's/git submodule .*/# skipped/' Makefile
  '';

  postInstall = ''
    wrapProgram "$out/bin/st" --set LOCALE_ARCHIVE ${glibcLocales}/lib/locale/locale-archive
  '';

})
