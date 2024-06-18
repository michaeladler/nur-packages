{ lib, stdenv, fetchFromGitHub, makeWrapper, git, coreutils, gnused, gnugrep }:

stdenv.mkDerivation (finalAttrs: {
  pname = "git-fixup";
  version = "unstable-2024-05-21";

  src = fetchFromGitHub {
    owner = "keis";
    repo = "git-fixup";
    rev = "dc8c1657ca0b12885950150ab30cf4f5df693905"; # tags/*
    sha256 = "1fxn57yda3im25rwrpzl4k7sx14yxcg9h0sss4p2299i0v3bdrrj";
  };

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  makeFlags = [
    "DESTDIR=${placeholder "out"}"
    "PREFIX="
  ];

  installFlags = [
    "install"
    "install-fish"
    "install-zsh"
  ];

  postInstall = ''
    wrapProgram $out/bin/git-fixup \
      --prefix PATH : "${lib.makeBinPath [ git coreutils gnused gnugrep ]}"
  '';

  meta = {
    description = "Fighting the copy-paste element of your rebase workflow";
    homepage = "https://github.com/keis/git-fixup";
    license = lib.licenses.isc;
    maintainers = with lib.maintainers; [ michaeladler ];
    platforms = lib.platforms.all;
    mainProgram = "git-fixup";
  };
})
