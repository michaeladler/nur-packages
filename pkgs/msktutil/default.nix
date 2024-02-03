{ stdenv, lib, fetchFromGitHub, pkg-config, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2024-02-02";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "9601e655e4bbdda2dcc7b1ddf322b26ee05bbf4f";
    sha256 = "1f5k3sl59pj35v18lsvf21c6g8754rmv4j2sjp7jmp9cz7ngyvwy";
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
