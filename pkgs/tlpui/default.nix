{ stdenv, lib, fetchFromGitHub, python3Packages, gtk3, gobject-introspection, tlp, pciutils, usbutils }:

python3Packages.buildPythonPackage rec {
  pname = "tlpui";
  version = "unstable-2023-10-15";

  src = fetchFromGitHub {
    owner = "d4nj1";
    repo = "TLPUI";
    rev = "e936e33df3a2a11e453b7daea62ba2a14179c6fb";
    sha256 = "0jmi4j510l9hn7hlfqhxy8abp51w9a03y63waamgx99n93milpfi";
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
