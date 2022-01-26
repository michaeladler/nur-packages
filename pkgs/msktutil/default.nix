{ stdenv, lib, fetchFromGitHub, pkgconfig, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2022-01-11";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "58858f18026f9b167e15b395337343f7f1716fbe";
    sha256 = "03il5sx5rmzwbfi2q63kdrcwc4s87vfa9hir93zrszv67hk2r50k";
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
