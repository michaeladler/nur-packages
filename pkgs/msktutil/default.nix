{ stdenv, lib, fetchFromGitHub, pkgconfig, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2021-09-23";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "abec3c17bfc143b659900a1cb77909e0a0ff7ee0";
    sha256 = "0rlpz5ymhj3kapdanvpcfqix77lr1ilwlhdcvn4hahbj0i80sax3";
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
