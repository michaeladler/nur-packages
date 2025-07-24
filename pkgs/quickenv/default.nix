{
  lib,
  rustPlatform,
  fetchFromGitHub,
  makeWrapper,
  direnv,
}:

rustPlatform.buildRustPackage {
  pname = "quickenv";
  version = "0.4.4-unstable-2025-06-27";

  src = fetchFromGitHub {
    owner = "untitaker";
    repo = "quickenv";
    rev = "b198053c97652b888eed29bfdf873b219f1dbf36";
    sha256 = "sha256-APIsYdT8J1oiYcGFEhIzMa9e7c3GOcyiZx1UTVRDrgU=";
  };

  cargoHash = "sha256-/o8WYFAr8J2PDiGHOCnl3u+QXi8es88CKCFLkfFE+fI=";

  doCheck = false;

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/quickenv --prefix PATH : ${
      lib.makeBinPath [
        direnv
      ]
    }
  '';

  meta = with lib; {
    description = "An unintrusive environment manager";
    homepage = "https://github.com/untitaker/quickenv";
    license = licenses.mit;
  };
}
