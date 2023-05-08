{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2023-05-04";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "6fa40363aa08b664a540c0c29ccb4b78bcc38c77";
    sha256 = "008i50hrxjn6gx5ridxyi5dpi27rcxh7dh5ac83w6vsp8xx6xhb5";
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
