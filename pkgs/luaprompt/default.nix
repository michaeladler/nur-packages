{ stdenv
, lib
, fetchFromGitHub
, pkg-config
, makeWrapper
, luajit
, luajitPackages
, readline
}:

stdenv.mkDerivation rec {

  pname = "luaprompt";
  version = "unstable-2023-07-25";

  src = fetchFromGitHub {
    owner = "dpapavas";
    repo = "luaprompt";
    rev = "1e4171298b2ba58f74f7d84417de542c7438493d";
    sha256 = "0h9sndg426vhakv2id3f1bzn09jjcm36bkkjzikl7a4ph9q9km84";
  };

  nativeBuildInputs = [ pkg-config makeWrapper ];

  buildInputs = [ luajit readline luajitPackages.argparse ];

  makeFlags = [ "DESTDIR=$(out)" "PREFIX=" "MANDIR=man" ];

  patchPhase = ''
    sed -i Makefile -e 's/^VERSION =.*/VERSION = jit/'
    sed -i Makefile -e 's#^LIBDIR =.*#LIBDIR = \$(PREFIX)/lib/lua/5.1#'

    # prefix install-location with $(DESTDIR)
    sed -ri 's:\$\((BIN|LIB|MAN1)DIR\):\$(DESTDIR)\$(\1DIR):g' Makefile

    # replace /usr/bin/install with 'install' and rely on PATH
    sed -i Makefile -e 's/^INSTALL=.*/INSTALL=install/'

    sed -i luap.lua -e "s#/usr/bin/env lua#${luajit}/bin/luajit#"
  '';

  postFixup = ''
    LUA_CPATH=$out/lib/lua/5.1/?.so;$LUA_CPATH
    wrapProgram $out/bin/luap \
      --set LUA_PATH "$LUA_PATH" \
      --set LUA_CPATH "$LUA_CPATH"
  '';

  meta = with lib; {
    description =
      "An embeddable Lua command prompt as well as a stand-alone interpreter with pretty-printing and autocompletion.";
    homepage = "https://github.com/dpapavas/luaprompt";
    license = licenses.mit;
    platforms = platforms.unix;
  };

}
