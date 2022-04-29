{ dbus_proxy, lua, fetchFromGitHub }:
let
  pname = "pulseaudio_dbus";
in

with lua.pkgs;

buildLuaPackage rec {
  version = "unstable-2017-11-11";
  name = "${pname}-${version}";
  inherit pname;

  src = fetchFromGitHub {
    owner = "stefano-m";
    repo = "lua-pulseaudio_dbus";
    rev = "b0f6774870658c2f776af6ad4596037f2f60191e"; # tags/*
    sha256 = "1l4nalziwmy3d7sb4jij2d1cml5ghzkg8cwj25v82brj36v3kqd7";
  };

  propagatedBuildInputs = [ dbus_proxy ];

  buildPhase = ":";

  installPhase = ''
    mkdir -p "$out/share/lua/${lua.luaversion}"
    cp -r src/${pname} "$out/share/lua/${lua.luaversion}/"
  '';

}
