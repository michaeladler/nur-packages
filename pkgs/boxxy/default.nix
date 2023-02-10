{ lib
, rustPlatform
, fetchFromGitHub
, notmuch
}:

rustPlatform.buildRustPackage rec {
  pname = "boxxy";
  version = "unstable-2023-02-09";

  src = fetchFromGitHub {
    owner = "queer";
    repo = "boxxy";
    rev = "33838a3eb146e577fc1f73768a2be75ec7a4395b";
    sha256 = "0n1fyqxm5dassyr05fikisw8kdg3razbrnppx8ylg7s6qm0cxz2s";
  };

  cargoHash = "sha256-R5L3hyoMj8Aj3R6jQQjg5VOvGU5KV8+/ai5BRRu4qVY=";

  meta = with lib; {
    description = "boxxy puts bad Linux applications in a box with only their files.";
    homepage = "https://github.com/queer/boxxy";
    license = licenses.mit;
  };
}
