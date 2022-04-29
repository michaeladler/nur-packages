{ lib, stdenv, fetchFromGitHub, lua, cairo, librsvg, cmake, imagemagick, pkg-config, gdk-pixbuf
, xorg, libstartup_notification, libxdg_basedir, libpthreadstubs
, xcb-util-cursor, makeWrapper, pango, gobject-introspection
, which, dbus, nettools, git, doxygen
, xmlto, docbook_xml_dtd_45, docbook_xsl, findXMLCatalogs
, libxkbcommon, xcbutilxrm, hicolor-icon-theme
, asciidoctor
, fontsConf
, gtk3Support ? false, gtk3 ? null
, luaEnv ? lua.withPackages(ps: [ ps.lgi ps.ldoc ])
}:

# needed for beautiful.gtk to work
assert gtk3Support -> gtk3 != null;

stdenv.mkDerivation rec {
  pname = "awesome";
  version = "unstable-2022-03-21";

  src = fetchFromGitHub {
    owner = "awesomewm";
    repo = "awesome";
    rev = "c539e0e4350a42f813952fc28dd8490f42d934b3";
    sha256 = "111sgx9sx4wira7k0fqpdh76s9la3i8h40wgaii605ybv7n0nc0h";
  };

  nativeBuildInputs = [
    cmake
    doxygen
    imagemagick
    makeWrapper
    pkg-config
    xmlto docbook_xml_dtd_45
    docbook_xsl findXMLCatalogs
    asciidoctor
  ];

  outputs = [ "out" "doc" ];

  FONTCONFIG_FILE = toString fontsConf;

  propagatedUserEnvPkgs = [ hicolor-icon-theme ];
  buildInputs = [ cairo librsvg dbus gdk-pixbuf gobject-introspection
                  git luaEnv libpthreadstubs libstartup_notification
                  libxdg_basedir lua nettools pango xcb-util-cursor
                  xorg.libXau xorg.libXdmcp xorg.libxcb xorg.libxshmfence
                  xorg.xcbutil xorg.xcbutilimage xorg.xcbutilkeysyms
                  xorg.xcbutilrenderutil xorg.xcbutilwm libxkbcommon
                  xcbutilxrm ]
                  ++ lib.optional gtk3Support gtk3;

  cmakeFlags = [
    #"-DGENERATE_MANPAGES=ON"
    "-DOVERRIDE_VERSION=${version}"
  ] ++ lib.optional lua.pkgs.isLuaJIT "-DLUA_LIBRARY=${lua}/lib/libluajit-5.1.so"
  ;

  GI_TYPELIB_PATH = "${pango.out}/lib/girepository-1.0";
  # LUA_CPATH and LUA_PATH are used only for *building*, see the --search flags
  # below for how awesome finds the libraries it needs at runtime.
  LUA_CPATH = "${luaEnv}/lib/lua/${lua.luaversion}/?.so";
  LUA_PATH  = "${luaEnv}/share/lua/${lua.luaversion}/?.lua;;";

  postInstall = ''
    # Don't use wrapProgram or the wrapper will duplicate the --search
    # arguments every restart
    mv "$out/bin/awesome" "$out/bin/.awesome-wrapped"
    makeWrapper "$out/bin/.awesome-wrapped" "$out/bin/awesome" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --add-flags '--search ${luaEnv}/lib/lua/${lua.luaversion}' \
      --add-flags '--search ${luaEnv}/share/lua/${lua.luaversion}' \
      --prefix GI_TYPELIB_PATH : "$GI_TYPELIB_PATH"

    wrapProgram $out/bin/awesome-client \
      --prefix PATH : "${which}/bin"
  '';

  passthru = {
    inherit lua;
  };

  meta = with lib; {
    description = "Highly configurable, dynamic window manager for X";
    homepage    = "https://awesomewm.org/";
    license     = licenses.gpl2Plus;
    maintainers = with maintainers; [ lovek323 rasendubi ];
    platforms   = platforms.linux;
  };
}
