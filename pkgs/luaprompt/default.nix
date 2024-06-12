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
  version = "unstable-2024-06-11";

  src = fetchFromGitHub {
    owner = "dpapavas";
    repo = "luaprompt";
    rev = "2f00a0d9cb09d2374b5a160853fb2e3e6956b5d7";
    sha256 = "03pjaihywfrjfh5dz7y0fdd2rhzl36gdx0ifbx7irjnl6w6nizzg";
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
