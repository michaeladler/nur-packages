{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-08-21";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "4e26e2189e4a7a7a9013ffa0cd9ffd8d8041361f";
    sha256 = "02vr1a5kjnd4zfxa299slwfrapdnp311rfhyyzfn6lzcwx7ganny";
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
