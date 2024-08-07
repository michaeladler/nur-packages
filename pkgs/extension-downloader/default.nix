{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-08-06";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "69b2e1715ce6dfc998d8d24ff1a4f4963c0b2bdf";
    sha256 = "182hhq36fn39vbd5ph8hg2fkzi4civ40wp1ysblpvxr1ighmjs76";
  };

  cargoHash = "sha256-JQ0dK6AAw76Fi3t0I7Dt8RqFDTlsM/OmR14pLM9qu50=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
