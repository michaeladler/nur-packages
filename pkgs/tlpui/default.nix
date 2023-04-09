{ stdenv, lib, fetchFromGitHub, python3Packages, gtk3, gobject-introspection, tlp, pciutils, usbutils }:

python3Packages.buildPythonPackage rec {
  pname = "tlpui";
  version = "unstable-2023-04-08";

  src = fetchFromGitHub {
    owner = "d4nj1";
    repo = "TLPUI";
    rev = "e5f5ae6210910174561e66b33ac8c622d8cb2bb2";
    sha256 = "0znp2y1kl9xq5p8r8ykb7m97dr1sljqj2gxwrcnfvsx1l4q86qzv";
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
