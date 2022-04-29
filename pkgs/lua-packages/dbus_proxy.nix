{ lua, fetchFromGitHub }:
let

  pname = "dbus_proxy";

in

with lua.pkgs;

buildLuaPackage rec {
  version = "unstable-2020-10-11";
  name = "${pname}-${version}";
  inherit pname;

  src = fetchFromGitHub {
    owner = "stefano-m";
    repo = "lua-dbus_proxy";
    rev = "7ffddc07acbed4c92004d310e067e9e6b74b4262"; # tags/*
    sha256 = "0kl8ff1g1kpmslzzf53cbzfl1bmb5cb91w431hbz0z0vdrramh6l";
  };

  propagatedBuildInputs = [ lgi ];

  buildPhase = ":";

  installPhase = ''
    mkdir -p "$out/share/lua/${lua.luaversion}"
    cp -r src/${pname} "$out/share/lua/${lua.luaversion}/"
  '';

}
