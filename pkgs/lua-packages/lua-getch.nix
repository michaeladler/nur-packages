{ lib, lua, fetchFromGitHub, pkg-config }:

lua.pkgs.buildLuaPackage {
  pname = "lua-getch";
  version = "unstable-2021-01-06";

  src = fetchFromGitHub {
    owner = "max1220";
    repo = "lua-getch";
    rev = "e2751f71bdf51f80b73d3be8281beac6b4d033d0";
    sha256 = "1s8dx064c50q2xhlshybxbfq4z6n3p67bbd6h8syrkca8krr3jny";
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
