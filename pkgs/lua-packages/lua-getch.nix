{ lib, lua, fetchFromGitHub, pkg-config }:

lua.pkgs.buildLuarocksPackage rec {
  pname = "lua-getch";
  version = "unstable-2023-01-11";

  src = fetchFromGitHub {
    owner = "max1220";
    repo = "lua-getch";
    rev = "78300ba06d6de069a08be8cafe280a16a29f38cd";
    sha256 = "0nwl3b5ghkx9gpypwrmxfhcws1i7ypp4kfnxdhay2ywqyld7fajq";
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
