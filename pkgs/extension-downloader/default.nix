{ lib, fetchFromGitHub, rustPlatform, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "extension-downloader";
  version = "unstable-2024-06-27";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "extension-downloader";
    rev = "2b59cdde55fabf9173e7b1cbc817f523df1d7c0a";
    sha256 = "1f7cy770ppasniib0zw8s9n4rb34z12wdh70s48x7pb0w68h1xm3";
  };

  cargoHash = "sha256-UnIauCMUeMPtdSfuF87hoBFgYmSqKnm8MQn8Do3CFr0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Download browser extensions for Firefox and Chromium-based browsers";
    homepage = "https://github.com/michaeladler/extension-downloader";
    license = licenses.asl20;
    maintainers = with maintainers; [ michaeladler ];
  };
}
