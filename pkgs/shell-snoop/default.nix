{ stdenv, lib, fetchFromGitHub, libcap_ng }:

stdenv.mkDerivation rec {
  pname = "shell-snoop";
  version = "2021-06-24";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "shell-snoop";
    rev = "7d49fc690a32660c5446bfff5fb891565eac16e9";
    sha256 = "1qc2msykhxaw50g9sfw6gvjahfsvdbfxapykricczr3k9aw0hd0z";
  };

  nativeBuildInputs = [ ];

  buildInputs = [ libcap_ng ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  meta = with lib; {
    homepage = "https://github.com/michaeladler/shell-snoop";
    description = "Figure out the exact command which was used to run a child process in a shell";
    maintainers = [ "Michael Adler <therisen06@gmail.com>" ];
    platforms = platforms.all;
    license = licenses.asl20;
  };
}
