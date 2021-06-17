{ stdenv, lib, fetchFromGitHub, autoreconfHook, pkg-config, libXi, libXrandr, libXext }:

stdenv.mkDerivation {
  name = "xplugd";
  version = "2020-07-08";

  src = fetchFromGitHub {
    owner = "troglobit";
    repo = "xplugd";
    rev = "a878b761ab5439555f1c64547b26dde588d5b34a";
    sha256 = "11vjr69prrs4ir9c267zwq4g9liipzrqi0kmw1zg95dbn7r7zmql";
  };

  nativeBuildInputs = [ autoreconfHook pkg-config ];

  buildInputs = [ libXi libXrandr libXext ];

  meta = with lib; {
    homepage = "https://github.com/troglobit/xplugd";
    description = "Monitor, keyboard, and mouse plug/unplug helper for X";
    platforms = with platforms; freebsd ++ linux;
    license = licenses.mit;
  };
}
