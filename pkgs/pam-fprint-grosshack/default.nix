{ stdenv
, lib
, fetchFromGitLab
, pkg-config
, gobject-introspection
, meson
, ninja
, perl
, gettext
, cairo
, gtk-doc
, libxslt
, docbook-xsl-nons
, docbook_xml_dtd_412
, fetchurl
, glib
, gusb
, dbus
, polkit
, nss
, pam
, systemd
, libfprint
, python3
, libpam-wrapper
}:

stdenv.mkDerivation rec {
  pname = "pam-fprint-grosshack";
  version = "unstable-2022-07-27";

  src = fetchFromGitLab {
    owner = "mishakmak";
    repo = "pam-fprint-grosshack";
    rev = "45b42524fb5783e1e555067743d7e0f70d27888a";
    sha256 = "0b92300sw8mxpjb51ik72rids837nxyafvx534qpx87znxjk7dx1";
  };

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
    perl # for pod2man
    gettext
    gtk-doc
    libxslt
    dbus
    docbook-xsl-nons
    docbook_xml_dtd_412
  ];

  buildInputs = [
    glib
    polkit
    nss
    pam
    systemd
    libfprint
    libpam-wrapper
  ];

  doCheck = false;

  mesonFlags = [
    "-Dgtk_doc=true"
    "-Dpam_modules_dir=${placeholder "out"}/lib/security"
    "-Dsysconfdir=${placeholder "out"}/etc"
    "-Ddbus_service_dir=${placeholder "out"}/share/dbus-1/system-services"
    "-Dsystemd_system_unit_dir=${placeholder "out"}/lib/systemd/system"
  ];

  meta = with lib; {
    homepage = "https://gitlab.com/mishakmak/pam-fprint-grosshack";
    description = "This is a fork of the pam module which implements the simultaneous password and fingerprint behaviour present in pam_thinkfinger";
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ michaeladler ];
  };
}
