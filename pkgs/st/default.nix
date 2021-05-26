{ sources, pkgs, fetchFromGitHub, harfbuzz, glibcLocales, makeWrapper }:

pkgs.st.overrideAttrs (old: {

  buildInputs = old.buildInputs ++ [ harfbuzz ];

  nativeBuildInputs = old.nativeBuildInputs ++ [ makeWrapper ];

  src = fetchFromGitHub (with sources.st; { inherit owner repo rev sha256; });

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
