{ stdenv, lib, fetchFromGitHub, pkg-config, autoreconfHook, kerberos, cyrus_sasl, openldap }:

stdenv.mkDerivation rec {
  version = "unstable-2022-12-23";
  name = "msktutil";

  src = fetchFromGitHub {
    owner = "msktutil";
    repo = "msktutil";
    rev = "7c1338ea4a7679966c5eb671eeb63fb68c0a05f4";
    sha256 = "0hymw8j6v147z2w22z4p98spx74hxhy4bmpas6iwkwgmmq9nghgy";
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
