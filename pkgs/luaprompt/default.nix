{ stdenv
, lib
, fetchFromGitHub
, pkgconfig
, makeWrapper
, luajit
, luajitPackages
, readline
}:

stdenv.mkDerivation rec {

  pname = "luaprompt";
  version = "2015-11-19";

  src = fetchFromGitHub {
    owner = "dpapavas";
    repo = "luaprompt";
    rev = "ef260d2176fbb8c07b585db18c85ff7c0b81589b";
    sha256 = "12dl9nzjvy1hl0f2pg1qjkakqa51py4ad9s7y4h9gy3kh14bc560";
  };

  nativeBuildInputs = [ pkgconfig makeWrapper ];

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
      --prefix LUA_PATH ";" "$LUA_PATH" \
      --prefix LUA_CPATH ";" "$LUA_CPATH"
  '';

  meta = with lib; {
    description =
      "An embeddable Lua command prompt as well as a stand-alone interpreter with pretty-printing and autocompletion.";
    homepage = "https://github.com/dpapavas/luaprompt";
    license = licenses.mit;
    platforms = platforms.unix;
  };

}
