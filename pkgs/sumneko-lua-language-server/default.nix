final: prev:

prev.sumneko-lua-language-server.overrideAttrs (oa: {

  patches = (oa.patches or [ ]) ++ [
    ./patches/fsevent_linux.cpp.diff
  ];

  postPatch = ''
    rm script/service/telemetry.lua
    touch script/service/telemetry.lua
  '';

})
