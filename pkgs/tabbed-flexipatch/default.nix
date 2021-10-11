{ lib, stdenv, fetchFromGitHub, xorgproto, libX11, libXft, customConfig ? null, customPatches ? null }:

with lib;

stdenv.mkDerivation {
  pname = "tabbed-flexipatch";
  version = "unstable-2021-07-29";

  src = fetchFromGitHub {
    owner = "bakkeby";
    repo = "tabbed-flexipatch";
    rev = "73bc3d65128af4dfbac4a922a4369c849cfe3d3e";
    sha256 = "1fi0jgz42h3k8yqzvs22kksnm96ay9ka4sg81na16hmy9p3xp9nc";
  };

  postPatch = (lib.optionalString (customConfig != null) ''
    cp ${builtins.toFile "config.h" customConfig} ./config.h
  '') + (lib.optionalString (customPatches != null) ''
    cp ${builtins.toFile "patches.h" customPatches} ./patches.h
  '');

  buildInputs = [ xorgproto libX11 libXft ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  meta = {
    homepage = "https://github.com/bakkeby/tabbed-flexipatch";
    description = "A tabbed build with preprocessor directives to decide which patches to include during build time";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
