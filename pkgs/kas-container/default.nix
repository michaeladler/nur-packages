{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "kas-container";
  version = "unstable-2024-02-26";

  src = fetchFromGitHub {
    owner = "siemens";
    repo = "kas";
    rev = "c37ee375ed7f3259a48c983412abebf1a9333df2";
    sha256 = "0vphjv3z5rqhr3hyk2i040nf2vfacyn0ggd5ndr1kh43bakm1w3k";
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
