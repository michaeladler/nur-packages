{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-11-13";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "9f1c2e8981723fb83efd1289b6af6ba1c3bdbc57";
    sha256 = "1s7lp365ic4nzx6ki60dxsiyl1pb640f686f7r858cc6fxa617p9";
  };

  installPhase = ''
    install -D -m0755 kas-container $out/bin/kas-container
  '';

  meta = with lib; {
    homepage = "https://github.com/siemens/kas";
    description = "Setup tool for bitbake based projects";
    platforms = platforms.all;
    license = licenses.mit;
  };
}
