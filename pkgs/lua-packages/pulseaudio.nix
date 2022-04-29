{ lib, lua, fetchFromGitLab, pkg-config, libpulseaudio }:

let
  luaVersion = lib.versions.majorMinor lua.version;
in

lua.pkgs.buildLuaPackage {
  pname = "pulseaudio";
  version = "unstable-2020-06-24";

  src = fetchFromGitLab {
    owner = "therisen06";
    repo = "lua-pulseaudio";
    rev = "c55ea172412f217e3b6715dafc70529f3b2bfa5b";
    sha256 = "0mm8lggr2dqzyrhmfffvknx80p2w7gavkc04mq8zbfas658n5kbg";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ libpulseaudio ];

  preBuild = let libdir = "$out/lib/lua/${if luaVersion == "2.1" then "5.1" else luaVersion}"; in
    ''
      mkdir -p ${libdir}
      makeFlagsArray=(
        INST_LIBDIR=${libdir}/pulseaudio.so
      );
    '';

  meta = with lib; {
    description = "some Lua bindings to pulseaudio";
    homepage = "https://github.com/liaonau/lua-pulseaudio";
    platforms = platforms.unix;
  };
}
