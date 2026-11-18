{
  lib,
  buildGoModule,
  fetchFromGitHub,
  git,
  makeWrapper,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "open-code-review";
  version = "1.13.12";

  src = fetchFromGitHub {
    owner = "alibaba";
    repo = "open-code-review";
    rev = "v${finalAttrs.version}";
    hash = "sha256-WiX94kDqfhLyw2sx442VXLQuB9NS7Fkr/D1b4w/bDHI=";
  };

  subPackages = [ "cmd/opencodereview" ];
  vendorHash = "sha256-7/cO+9a/jdN4WuYPdwOUKgT3NFDOSM9Byt4AyjSrJfE=";

  ldflags = [ "-X main.Version=v${finalAttrs.version}" ];

  nativeBuildInputs = [ makeWrapper ];
  nativeCheckInputs = [ git ];

  postInstall = ''
    mv $out/bin/opencodereview $out/bin/ocr
    wrapProgram $out/bin/ocr --prefix PATH : ${lib.makeBinPath [ git ]}
  '';

  passthru.updateScript = nix-update-script {
    extraArgs = [ "--flake" "--version=stable" ];
  };

  meta = {
    description = "AI-powered code review CLI";
    homepage = "https://github.com/alibaba/open-code-review";
    changelog = "https://github.com/alibaba/open-code-review/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ michaeladler ];
    platforms = [ "x86_64-linux" "aarch64-linux" ];
    mainProgram = "ocr";
  };
})
