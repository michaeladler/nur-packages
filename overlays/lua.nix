final: prev: rec {

  luajit = prev.luajit.override {
    packageOverrides = luaself: luaprev: {

      lua-getch = final.callPackage ./pkgs/lua-packages/lua-getch.nix {
        inherit (luaprev) buildLuarocksPackage;
      };

    };
  };

  luajitPackages = luajit.pkgs;
}
