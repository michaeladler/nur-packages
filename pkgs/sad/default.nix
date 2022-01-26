{ lib
, fetchFromGitHub
, naersk-lib
}:

naersk-lib.buildPackage rec {
  pname = "sad";
  version = "unstable-2022-01-26";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "sad";
    rev = "2589ee27351a0c0819ba9deb04b31862d3ce7042";
    sha256 = "01danzpayvi134318cz4x11y5wi6wcp9rwj3wig1vl8l8p9zyyzc";
  };

  meta = with lib; {
    description = "CLI search and replace";
    homepage = "https://github.com/ms-jpq/sad";
    license = licenses.mit;
  };
}
