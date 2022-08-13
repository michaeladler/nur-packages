{ lib, lua, fetchFromGitHub, pkg-config }:

lua.pkgs.buildLuarocksPackage rec {
  pname = "lua-getch";
  version = "unstable-2022-08-13";

  src = fetchFromGitHub {
    owner = "max1220";
    repo = "lua-getch";
    rev = "c30f21eeb4e82e6a8dd3afa751cb3d378162aec7";
    sha256 = "056b2imbfppm4jc7nwsmidsrgrddd18gdi8kdggamflfjrnibcg9";
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
