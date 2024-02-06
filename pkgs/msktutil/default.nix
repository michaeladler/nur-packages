{ stdenv, lib, fetchFromGitHub, pkg-config, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2024-02-05";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "3e0306eea70b2b80c0a112536ea6720d6c5eb106";
    sha256 = "0kj2qjczcpf96syb5hqv3lqjdr1jlczkp3m1wr8pqrbgplyv922r";
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
