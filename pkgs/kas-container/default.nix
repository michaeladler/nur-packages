{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-10-21";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "be8307b586a491636fa744c68f0117f17de671b0";
    sha256 = "0rrv91d5izk4nhlzj4nzm5grvpm3m0ir9jm88b7c5pj03i0bi4wv";
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
