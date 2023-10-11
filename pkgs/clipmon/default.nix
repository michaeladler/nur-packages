{ lib
, rustPlatform
, fetchFromSourcehut
, pkg-config
, wayland
, wayland-protocols
}:

rustPlatform.buildRustPackage rec {
  pname = "clipmon";
  version = "unstable-2022-08-28";

  src = fetchFromSourcehut {
    owner = "~whynothugo";
    repo = "clipmon";
    rev = "2e338fdc2841c3b2de9271d90fcceceda9e45d29"; # pin
    hash = "sha256-bEMgJYz3e2xwMO084bmCT1oZImcmO3xH6rIsjvAxnTA=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    wayland
    wayland-protocols
  ];

  postFixup = ''
    patchelf --set-rpath "${lib.makeLibraryPath buildInputs}" $out/bin/clipmon
  '';

  cargoHash = "sha256-TI7KVj9SOG+RovkzwMBX3lQ0QFKu1AS5nIHzvHXg/SU=";

  meta = with lib; {
    description = "clipboard monitor for wayland";
    homepage = "https://git.sr.ht/~whynothugo/clipmon";
    license = licenses.isc;
  };
}
