{ stdenv, lib, fetchFromGitHub, pkg-config, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2024-01-29";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "ae6d3845740349d10c1d4f21a35d97fd5018763c";
    sha256 = "113xx6wi3nrlm66zn4zbkzqr5468gqz2nrkzlbwxyrjb69sgi8bq";
  };

  nativeBuildInputs = [ pkg-config autoreconfHook ];
  buildInputs = [ kerberos cyrus_sasl openldap ];

  postInstall = ''
    rm -rf $out/sbin
  '';

  meta = with lib; {
    description =
      "Msktutil creates user or computer accounts in Active Directory, creates Kerberos keytabs on Unix/Linux systems, adds and removes principals to and from keytabs and changes the user or computer account's password.";
    homepage = "https://github.com/msktutil/msktutil";
    license = licenses.gpl2Only;
  };
}
