{ lib
, rustPlatform
, fetchFromGitHub
, stdenv
, installShellFiles
, installShellCompletions ? stdenv.hostPlatform == stdenv.buildPlatform
, installManPages ? stdenv.hostPlatform == stdenv.buildPlatform
, pkg-config
, libiconv
, openssl
, notmuch
, withImapBackend ? false
, withNotmuchBackend ? true
, withSmtpSender ? false
}:

rustPlatform.buildRustPackage rec {
  pname = "himalaya";
  version = "unstable-2023-02-14";

  src = fetchFromGitHub {
    owner = "soywod";
    repo = "himalaya";
    rev = "3cc1ed7583160542e94c78c9b9ff490eb0a0bbc6"; # tags/*
    sha256 = "09j6giaqdw9wmhlyfchkybd5g45gmq5r1f9q3yzm8pnjs8gws1y8";
  };

  cargoSha256 = "sha256-FY6HjTDadTWffbZjkre+2ge+LeSoC8y7xvNDyMtGaCA=";

  nativeBuildInputs = [ ]
    ++ lib.optional (installManPages || installShellCompletions) installShellFiles
    ++ lib.optional (!stdenv.hostPlatform.isDarwin) pkg-config;

  buildInputs = [ openssl ]
    ++ lib.optional withNotmuchBackend notmuch;

  buildNoDefaultFeatures = true;
  buildFeatures = [ ]
    ++ lib.optional withImapBackend "imap-backend"
    ++ lib.optional withNotmuchBackend "notmuch-backend"
    ++ lib.optional withSmtpSender "smtp-sender";

  postInstall = lib.optionalString installManPages ''
    mkdir -p $out/man
    $out/bin/himalaya man $out/man
    installManPage $out/man/*
  '' + lib.optionalString installShellCompletions ''
    installShellCompletion --cmd himalaya \
      --bash <($out/bin/himalaya completion bash) \
      --fish <($out/bin/himalaya completion fish) \
      --zsh <($out/bin/himalaya completion zsh)
  '';

  meta = with lib; {
    description = "Command-line interface for email management";
    homepage = "https://github.com/soywod/himalaya";
    changelog = "https://github.com/soywod/himalaya/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ soywod toastal yanganto ];
  };
}
