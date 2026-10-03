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
    rev = "fa6c339d47944603a2038c33bca2d57f2e74a54b";
    sha256 = "1y8zzhmpixl443ml0y06305zb6m2hwgcnvxznv70lzgzf1z73912";
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
