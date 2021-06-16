{ orig, fetchFromGitHub, harfbuzz, glibcLocales, makeWrapper }:

orig.overrideAttrs (old: {
  outputs = [ "out" "terminfo" ];

  version = "2021-06-03";

  src = fetchFromGitHub {
    owner = "lukesmithxyz";
    repo = "st";
    rev = "0af4782a47cc1b0918bdc41fb61b1a5d358f75f6";
    sha256 = "1ny8di1s932r5am5scbhgp89fqvgri6q8f55kqg7v3nhf5cvim8s";
  };

  buildInputs = old.buildInputs ++ [ harfbuzz ];

  nativeBuildInputs = old.nativeBuildInputs ++ [ makeWrapper ];

  postPatch = ''
    # skip terminfo which conflicts with ncurses
    sed -i '/tic /d' Makefile
  '';

  preInstall = ''
    sed -i -e 's/git submodule .*/# skipped/' Makefile
  '';

  postInstall = ''
    install -dm 755 "$terminfo/share/terminfo/s/"
    tic -sx -o "$terminfo/share/terminfo" st.info
    mkdir -p $out/nix-support
    echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
  '';

})
