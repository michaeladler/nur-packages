{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-01";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "dda7cda5d7e5affaa2c3d0df5478b74536924faa";
    sha256 = "1fv8a3l52pwr08xzjv4j5kqk4ki9hs2137ciz7q0ka083mgcr2qs";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
