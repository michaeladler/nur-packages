{ lib, lua, fetchFromGitHub, pkg-config }:

lua.pkgs.buildLuarocksPackage rec {
  pname = "lua-getch";
  version = "unstable-2022-08-07";

  src = fetchFromGitHub {
    owner = "max1220";
    repo = "lua-getch";
    rev = "c538b72eb5c38a9d1e0c3712481f0796f6714ce5";
    sha256 = "06a2cqkiq2i0vbv8jb4qs1aggjqzcfv8hhs5kjm2vfpfdf6sd9qi";
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
