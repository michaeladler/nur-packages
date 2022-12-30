{ stdenv, lib, fetchFromGitHub, python3Packages, gtk3, gobject-introspection, tlp, pciutils, usbutils }:

python3Packages.buildPythonPackage rec {
  pname = "tlpui";
  version = "unstable-2022-12-29";

  src = fetchFromGitHub {
    owner = "d4nj1";
    repo = "TLPUI";
    rev = "3ad213615af6d7d44ff374d7102c2dfb4fa97147";
    sha256 = "038ldhh1y0z9ph1aai41j13fi58bp6z75xvyb3c97wi6lzcjd65i";
  };

  nativeBuildInputs = [ gobject-introspection ];

  propagatedBuildInputs = with python3Packages;
    [
      pycairo
      pygobject3
      gtk3
    ] ++
    [
      tlp
      pciutils
      usbutils
    ];

  doCheck = false;

  patchPhase = ''
    substituteInPlace tlpui/file.py \
      --replace 'f"{settings.FOLDER_PREFIX}/usr/share/tlp/defaults.conf"' '"${tlp}/share/tlp/defaults.conf"'
  '';

  makeWrapperArgs = [
    "--set GI_TYPELIB_PATH $GI_TYPELIB_PATH"
    "--prefix XDG_DATA_DIRS : $out/share"
    "--suffix XDG_DATA_DIRS : $XDG_ICON_DIRS:$GSETTINGS_SCHEMAS_PATH"
  ];

  meta = with lib; {
    homepage = "https://github.com/deadc0de6/";
    description = "A GTK user interface for TLP written in Python";
    license = licenses.gpl2Only;
  };
}
