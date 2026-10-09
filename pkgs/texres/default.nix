{
  lib,
  craneLib,
  fetchFromGitHub,
  installShellFiles,
  python3,
  nix-update-script,
}:

(craneLib.buildPackage rec {
  pname = "texres";

  src = fetchFromGitHub {
    owner = "leoliu0";
    repo = "texres";
    rev = "a7ffa5616f21d47cfa8d057262798350d383f752";
    sha256 = "1g0xwfcqwvym81190xwqa7iak3dl0jigdr5m7civras1w7w2ji2f";
  };

  cargoArtifacts = craneLib.buildDepsOnly {
    inherit src;
    strictDeps = true;
  };

  nativeBuildInputs = [
    installShellFiles
  ];

  nativeCheckInputs = [
    python3
  ];

  doCheck = false;

  # cachix needs cargoArtifacts pushed separately: buildDepsOnly output is a
  # build-time input, so it is not part of the package's runtime closure.
  passthru.cargoArtifacts = cargoArtifacts;

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=stable"
    ];
  };

  meta = with lib; {
    description = "ratex is an ultra-fast, self-contained, pure-Rust TeX engine and typesetting toolchain";
    homepage = "https://github.com/leoliu0/ratex";
    license = licenses.asl20;
  };
}).overrideAttrs (old: {
  version = old.version;
  __intentionallyOverridingVersion = true;
})
