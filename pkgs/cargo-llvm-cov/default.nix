{ lib
, craneLib
, fetchCrate
, pkg-config
, openssl
}:

let
  pin = lib.importJSON ./pin.json;
in

craneLib.buildPackage rec {
  inherit (pin) pname version;

  src = fetchCrate pin;
  doCheck = false;

  meta = with lib; {
    description = "LLVM source-based code coverage";
    homepage = "https://github.com/taiki-e/cargo-llvm-cov";
    license = licenses.asl20;
  };

}
