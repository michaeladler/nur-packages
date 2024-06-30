{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "cliphist";
  version = "unstable-2024-06-29";

  src = fetchFromGitHub {
    owner = "sentriz";
    repo = "cliphist";
    rev = "c164c4c3f88c4bde94b0fe6edc5672b9bf1c0c8a";
    sha256 = "0a6z9fzam1v6ggr0g7vrfbbzna9kryvs8l9rcfagmb7lc15hqz9i";
  };

  vendorHash = "sha256-M5n7/QWQ5POWE4hSCMa0+GOVhEDCOILYqkSYIGoy/l0=";

  meta = with lib; {
    description = "Wayland clipboard manager";
    homepage = "https://github.com/sentriz/cliphist";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    maintainers = with maintainers; [ dit7ya ];
    mainProgram = "cliphist";
  };
}
