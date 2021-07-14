{ stdenv
, lib
, fetchurl
, dpkg
, alsa-lib
, at-spi2-atk
, at-spi2-core
, atk
, cairo
, cups
, dbus
, expat
, fontconfig
, freetype
, gdk-pixbuf
, glib
, gnome2
, gnome
, gsettings-desktop-schemas
, gtk3
, libpulseaudio
, libuuid
, libdrm
, libX11
, libXcomposite
, libXcursor
, libXdamage
, libXext
, libXfixes
, libXi
, libxkbcommon
, libXrandr
, libXrender
, libXScrnSaver
, libxshmfence
, libXtst
, mesa
, nspr
, nss
, pango
, udev
, xorg
, zlib
, xdg-utils
, wrapGAppsHook
, minigbm
}:

let

  rpath = lib.makeLibraryPath [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gnome2.GConf
    gtk3
    libdrm
    libpulseaudio
    libX11
    libxkbcommon
    libXScrnSaver
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXfixes
    libXi
    libXrandr
    libXrender
    libxshmfence
    libXtst
    libuuid
    mesa
    nspr
    nss
    pango
    udev
    xdg-utils
    xorg.libxcb
    zlib
    minigbm
  ];

  metadata = with builtins; fromJSON (readFile ./metadata.json);

in

# taken from nixpkgs brave
stdenv.mkDerivation {
  pname = "ungoogled-chromium";
  inherit (metadata) version;

  src = fetchurl {
    inherit (metadata) url sha256;
  };

  dontConfigure = true;
  dontBuild = true;
  dontPatchELF = true;
  doInstallCheck = true;

  nativeBuildInputs = [ dpkg wrapGAppsHook ];

  buildInputs = [ glib gsettings-desktop-schemas gnome.adwaita-icon-theme ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/opt/ungoogled-chromium

    cp -R * $out/opt/ungoogled-chromium/

    export BINARYWRAPPER=$out/opt/ungoogled-chromium/chrome-wrapper

    # Fix path to bash in $BINARYWRAPPER
    substituteInPlace $BINARYWRAPPER \
        --replace /bin/bash ${stdenv.shell}

    ln -sf $BINARYWRAPPER $out/bin/chromium

    patchelf \
        --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        --set-rpath "${rpath}" $out/opt/ungoogled-chromium/chrome

    # TODO: create $out/share/applications/chromium.desktop

    # Correct icons location
    icon_sizes=("48")

    for icon in ''${icon_sizes[*]}
    do
        mkdir -p $out/share/icons/hicolor/$icon\x$icon/apps
        ln -s $out/opt/ungoogled-chromium/product_logo_$icon.png $out/share/icons/hicolor/$icon\x$icon/apps/chromium.png
    done

    # Replace xdg-settings and xdg-mime
    ln -sf ${xdg-utils}/bin/xdg-settings $out/opt/ungoogled-chromium/xdg-settings
    ln -sf ${xdg-utils}/bin/xdg-mime $out/opt/ungoogled-chromium/xdg-mime

    runHook postInstall
  '';

  installCheckPhase = ''
    # Bypass upstream wrapper which suppresses errors
    $out/opt/ungoogled-chromium/chrome --version
  '';

  meta = with lib; {
    homepage = "https://github.com/Eloston/ungoogled-chromium";
    description = " Google Chromium, sans integration with Google ";
    license = licenses.bsd3;
    platforms = [ "x86_64-linux" ];
  };
}
