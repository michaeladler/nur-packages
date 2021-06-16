{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  name = "goofys";
  version = "2021-03-26";

  src = fetchFromGitHub {
    owner = "kahing";
    repo = "goofys";
    rev = "0c993271269b539196330a18716a33fbeeebd624";
    sha256 = "18is5sv2a9wmsm0qpakly988z1qyl2b2hf2105lpxrgl659sf14p";
  };

  vendorSha256 = "sha256-0gWjlxfjUYa2/Yq0lNSFP7rYOc14zi9saZ3FBHUF2Jc=";

  # tests require network
  doCheck = false;

  buildFlagsArray = [
    "-ldflags=-s -w -X main.Version=${src.rev}"
  ];

  postInstall = ''
    rm -f $out/bin/example
  '';

  meta = with lib; {
    homepage = "https://github.com/kahing/goofys";
    description = "a high-performance, POSIX-ish Amazon S3 file system written in Go";
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
