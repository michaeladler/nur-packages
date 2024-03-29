{ stdenv, lib, fetchFromGitHub, pkg-config, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2024-03-28";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "b8bbb6d23beb97d75f524e89784a1d1079c30ff7";
    sha256 = "0pw2fvq6dydpvyw8m9fqj1abdbmy18zffx85137q68jlkl1qb51c";
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
