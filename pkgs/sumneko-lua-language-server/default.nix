final: prev:

prev.sumneko-lua-language-server.overrideAttrs (oa: {

  postPatch = ''
    rm script/service/telemetry.lua
    touch script/service/telemetry.lua
  '';

})
