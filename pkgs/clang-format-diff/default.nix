{ lib, stdenv, python3, fetchurl }:

stdenv.mkDerivation rec {
  pname = "clang-format-diff";
  version = "16.0.6";

  src = fetchurl {
    url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${version}/clang-${version}.src.tar.xz";
    sha256 = "1186b6e6eefeadd09912ed73b3729e85b59f043724bb2818a95a2ec024571840";
  };

  checkInputs = [ ];
  propagatedBuildInputs = [ python3 ];

  installPhase = ''
    install -D -m0755 tools/clang-format/clang-format-diff.py $out/bin/clang-format-diff.py
  '';

  meta = with lib; {
    homepage = "https://github.com/llvm/llvm-project";
    description = "Parses the output of a unified diff and reformats all contained lines with clang-format";
    license = "Apache-2.0 WITH LLVM-exception";
  };

}
