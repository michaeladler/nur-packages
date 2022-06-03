{ lib
, craneLib
, fetchCrate
, pkg-config
, openssl
}:

craneLib.buildPackage rec {
  pname = "cargo-llvm-cov";
  version = "0.4.5";

  src = fetchCrate {
    inherit version pname;
    sha256 = "sha256-sD3UMcpZxZQ0vJfMpF6/iVvVQ4vziwdSeJQSVMzoazE=";
  };

  doCheck = false;

  meta = with lib; {
    description = "LLVM source-based code coverage";
    homepage = "https://github.com/taiki-e/cargo-llvm-cov";
    license = licenses.asl20;
  };

}
