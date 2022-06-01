{ lib, lua, fetchFromGitHub, pkg-config }:

lua.pkgs.buildLuaPackage {
  pname = "lua-getch";
  version = "unstable-2022-05-31";

  src = fetchFromGitHub {
    owner = "max1220";
    repo = "lua-getch";
    rev = "78d74b0a62dd94898e3cb8cb7945390a4a5eed28";
    sha256 = "1l1gjfdd4gq01nqg40zgfpw8qqgnd3zg4h1yj0ii6h5gc459s2an";
  };

  nativeBuildInputs = [ pkg-config ];

  postPatch = ''
    patchShebangs .
  '';

  preBuild = ''
    makeFlagsArray=(
      LUA_LIBS=-lluajit-5.1
      );
  '';

  meta = with lib; {
    description = "Provides a way to get raw Keyboard data in Lua";
    homepage = "https://github.com/max1220/lua-getch";
    license = licenses.mit;
    maintainers = with maintainers; [ michaeladler ];
    platforms = platforms.unix;
  };
}
