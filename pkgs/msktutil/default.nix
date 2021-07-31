{ stdenv, lib, fetchFromGitHub, pkgconfig, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2021-07-30";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "f53234a64bccaec07c53ae79c3cf77c74c13096e";
    sha256 = "15vfa9vqam5kcnd6lpsl884ih49m78fa8mswx6p07zjpjcp3n9r0";
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
