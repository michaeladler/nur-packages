{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "cliphist";
  version = "unstable-2024-05-02";

  src = fetchFromGitHub {
    owner = "sentriz";
    repo = "cliphist";
    rev = "19ef90ee35e6e3b27219d38ee43c82f52402431b";
    sha256 = "0yi17vlwp2nc51wr46yfw1hgqzv027q9324bb4rmzv6qn2yjikvx";
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
