{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, openssl }:

stdenv.mkDerivation rec {
  name = "sscep";
  version = "unstable-2021-11-08";

  src = fetchFromGitHub {
    owner = "certnanny";
    repo = "sscep";
    rev = "354acb8d66292286ca3fb75b93a240e9357b8718";
    sha256 = "1fc3szv2rbgcbac8zzql90v8rqwqlxnmhrnx1skazy8xaahqm91r";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "Simple SCEP client for Unix";
    homepage = "https://github.com/certnanny/sscep";
    license = licenses.openssl;
  };
}
