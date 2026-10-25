{
  buildGoModule,
  fetchFromGitHub,
  lib,
  which,
}:

buildGoModule {
  pname = "bed";
  version = "0.2.9-unstable-2026-10-24";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "22dd6f0ff6d7fbd825ee390257613fb0724f3e92";
    sha256 = "sha256-8AwMG52PVXeFUkj0I8XGk8t/+trVzcPFRUPr1Lbsh2E=";
  };

  vendorHash = "sha256-tp83T6V4HM7SgpZASMWnIoqgw/s/DhdJMsCu2C6OuTo=";

  nativeCheckInputs = [ which ];

  dontPatchELF = true;

  meta = with lib; {
    homepage = "https://github.com/itchyny/bed";
    description = "Binary editor written in Go";
    maintainers = with maintainers; [ michaeladler ];
    platforms = platforms.all;
    license = licenses.mit;
  };
}
