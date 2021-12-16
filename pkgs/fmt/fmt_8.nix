final: prev:

prev.fmt_8.overrideAttrs (old: {

  # this ensures that meson keeps the rpath
  postInstall = ''
    sed -i -e 's|^Libs:.*|Libs: -L''${libdir} -lfmt  -Wl,-rpath=''${libdir}|' $out/lib/pkgconfig/fmt.pc
  '';

})
