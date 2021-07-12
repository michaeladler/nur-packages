{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  name = "goofys";
  version = "2021-07-11";

  src = fetchFromGitHub {
    owner = "kahing";
    repo = "goofys";
    rev = "08534b28a2195d30bb3c45dce0b834f3696028b8";
    sha256 = "0w8ca5ippka2g9g7mqhqqvzyki2jzslys8s3665msb2qs944p6ii";
  };

  vendorSha256 = "sha256-GNzhRv0bk4iZ616YuZDCN8kXabFuDW/KT8ZWsDCBUco=";

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
