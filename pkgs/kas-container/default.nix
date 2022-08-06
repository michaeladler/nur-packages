{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2022-08-05";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "d1834dd6bffca1bd899766f0fc28d1c4ba0e2517";
    sha256 = "1d8p3z7lz207h89m0jn06cd2vk4q8x4nmd002r02fb1jl9lylaqf";
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
