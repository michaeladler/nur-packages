{ lib, lua, fetchFromGitHub, pkg-config }:

lua.pkgs.buildLuaPackage {
  pname = "lua-getch";
  version = "unstable-2022-06-04";

  src = fetchFromGitHub {
    owner = "max1220";
    repo = "lua-getch";
    rev = "90c2d5ad40a1584505b48897c99dbe431b2ed837";
    sha256 = "0gm61sb7l62awmvrnr107vw23mmgan5vaxg8s3papch3pxdjwwpj";
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
