{ stdenv, lib, fetchFromGitHub, pkgconfig, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2021-09-24";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "573d5c9d6ff6972d53f5a191231ed192e2addd9d";
    sha256 = "1f5fa3zrim9ryn0wxks2khpc32cq1hlpyrh86is6vf858ks6b8p9";
  };


  nativeBuildInputs = [ pkgconfig autoreconfHook ];
  buildInputs = [ kerberos cyrus_sasl openldap ];

  meta = with lib; {
    description =
      "Msktutil creates user or computer accounts in Active Directory, creates Kerberos keytabs on Unix/Linux systems, adds and removes principals to and from keytabs and changes the user or computer account's password.";
    homepage = "https://github.com/msktutil/msktutil";
    license = licenses.gpl2Only;
  };
}
