{ lib, lua, fetchFromGitHub, pkg-config }:

lua.pkgs.buildLuarocksPackage rec {
  pname = "lua-getch";
  version = "unstable-2022-08-07";

  src = fetchFromGitHub {
    owner = "max1220";
    repo = "lua-getch";
    rev = "6f6949a7d9d439a04662f39a340635991b68e733";
    sha256 = "0jak8xbcsxp9gw2y175ldzrhhxyjq45yhgc5207slnj9xa7262qg";
  };

  propagatedBuildInputs = [
    lua
  ];

  knownRockspec = "${src}/lua-getch-0.0-1.rockspec";

  patchPhase = ''
    substituteInPlace lua/lua-getch/init.lua \
      --replace "bit32" "bit"
  '';

  meta = with lib; {
    description = "Provides a way to get raw Keyboard data in Lua";
    homepage = "https://github.com/max1220/lua-getch";
    license = licenses.mit;
    maintainers = with maintainers; [ michaeladler ];
    platforms = platforms.unix;
  };
}
