{ lib, python3Packages, fetchurl }:

python3Packages.buildPythonApplication {
  pname = "clang-format-diff.py";
  version = "0.4.7";

  src = fetchurl {
    url = "https://github.com/llvm/llvm-project/raw/f93169226a298f8fb22d768671d5564030c0ffa9/clang/tools/clang-format/clang-format-diff.py";
    sha256 = "00sr7v8ijg05y76c29wglmxdbk22w4nk3kdsr90a6n4hmgi4a8vz";
  };

  checkInputs = [ ];
  propagatedBuildInputs = [ ];

  unpackPhase = "cp $src clang-format-diff.py";
  buildPhase = "true";
  setuptoolsCheckPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    cp clang-format-diff.py $out/bin/
    chmod +x $out/bin/*
  '';

  meta = with lib; {
    homepage = "https://github.com/llvm/llvm-project";
    description = "Parses the output of a unified diff and reformats all contained lines with clang-format";
    license = "Apache-2.0 WITH LLVM-exception";
  };
}
