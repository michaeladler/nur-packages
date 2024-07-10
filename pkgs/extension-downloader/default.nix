{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-07-09";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "d89e111ccb605071a2e8cbbb30f23bc37b597019";
    sha256 = "1sfv4i6sdc7y2pyqs4qcls3yygrz4y20rkk0n4r6a9k1ywjzhgwi";
  };

  cargoHash = "sha256-TEIY1Y/Ed3/a3Blw2aMpx6f0N1z7oSpdHJJAL4oCjko=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
