{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-03-19";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "dd442562b91bbc41d590bb1b43a5434cdc50dbf1";
    sha256 = "07jc4xkk7zh3451spij1p37xvhfqlfn4v824gwqrsl4fhf2qqfwp";
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
