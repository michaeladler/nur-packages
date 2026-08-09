{
  lib,
  rustPlatform,
  fetchFromGitHub,
  installShellFiles,
}:

rustPlatform.buildRustPackage {
  pname = "landstrip";
  version = "unstable-2026-08-06";

  src = fetchFromGitHub {
    owner = "landstrip";
    repo = "landstrip";
    rev = "4830ac62d5b972c1a40334b7b1a68e7d69701c6a";
    sha256 = "1q3dy5yv5nl3g8mwbr6rbya48578a7hy5h7h8d6459viclwhinn2";
  };

  cargoHash = "sha256-axM21y0HKtn2KOtXXXXdn8jv9vgWCn02snNxTnsf2g4=";

  doCheck = false;

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = ''
    installManPage man/man1/landstrip.1
  '';

  meta = with lib; {
    description = "A sandbox for coding agents with parametrized state.";
    homepage = "https://github.com/landstrip/landstrip";
    license = licenses.lgpl21Plus;
  };
}
