{ sources, pkgs, fetchFromGitHub, harfbuzz }:

pkgs.st.overrideAttrs (old: {

  buildInputs = old.buildInputs ++ [ harfbuzz ];

  src = fetchFromGitHub (with sources.st; { inherit owner repo rev sha256; });

  preInstall = ''
    sed -i -e 's/git submodule .*/# skipped/' Makefile
  '';

})
