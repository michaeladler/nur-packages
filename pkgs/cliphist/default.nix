{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "cliphist";
  version = "unstable-2024-05-26";

  src = fetchFromGitHub {
    owner = "sentriz";
    repo = "cliphist";
    rev = "c3be9a342a2d067077a5701a06df936caf87d2d5";
    sha256 = "02pz0gavl3al1k4sxwqk7j6la663cmpbdbvmzvbnxfmhqzm5m8ky";
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
