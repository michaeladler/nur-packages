{ lib, fetchFromGitHub, rustPlatform, clang, lld, pkg-config, openssl }:

rustPlatform.buildRustPackage {
  pname = "semantic-web-lsp";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "ajuvercr";
    repo = "semantic-web-lsp";
    rev = "76ef70a20a716d52ca683f71579a19fcd4450971";
    hash = "sha256-6txfr2eNngZ/N1wLKd6YHydXHPwpWNuPXT2/9jKggb4=";
  };

  useFetchCargoVendor = true;

  cargoHash = "sha256-NidOJDPH4+7qK3Cvz6DQfFSoOatM+CgYx89eGKAtmNw=";

  nativeBuildInputs = [ pkg-config clang lld ];

  buildInputs = [ openssl ];

  postFixup = ''
    patchelf $out/bin/lsp-bin \
      --add-rpath ${lib.makeLibraryPath [ openssl ]}
  '';

  meta = with lib; {
    description = "semantic web language server";
    homepage = "https://github.com/ajuvercr/semantic-web-lsp";
    license = licenses.mit;
    maintainers = with maintainers; [ michaeladler ];
  };
}
