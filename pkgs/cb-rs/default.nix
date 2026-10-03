{
  lib,
  rustPlatform,
  fetchFromGitHub,
  installShellFiles,
}:

rustPlatform.buildRustPackage {
  pname = "cb-rs";
  version = "0-unstable-2026-10-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "cb-rs";
    rev = "503ff3b07686e08d9cfe2197cf89a7537072cbef";
    sha256 = "sha256-zp+4oGqY2/uczt8aYKVKzNFwEO+w+2tQwkV9bLQl5Co=";
  };

  cargoHash = "sha256-pxMOR/QhyRt7onArIyQPf2qhA/paMKm83pm/7MbOPJk=";

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = ''
    $out/bin/cb man > cb.1
    installManPage cb.1

    installShellCompletion --cmd cb \
      --bash <($out/bin/cb completions bash) \
      --fish <($out/bin/cb completions fish) \
      --zsh <($out/bin/cb completions zsh)
  '';

  meta = {
    description = "a cut/copy/paste tool for the command line";
    homepage = "https://github.com/michaeladler/cb-rs";
    license = lib.licenses.asl20;
  };
}
