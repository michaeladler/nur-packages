{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-nvim";
  version = "unstable-2021-10-20";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq_nvim";
    rev = "a523231c8199d74ad5f7e3627f145dd876600d7e"; # coq
    sha256 = "16l95bb5k1bazy3ldpx6wsa316iqcjzm9xs5gxrzvgfbqmphnzrn";
  };

  patches = [
    ./patches/0001-Do-not-use-venv.patch
  ];

  passthru.python3Dependencies = ps: with ps; [
    (
      ps.buildPythonPackage {
        pname = "std2";
        version = "unstable-2021-09-06";

        src = fetchFromGitHub {
          owner = "ms-jpq";
          repo = "std2";
          rev = "769d5491fd65d6ad651409f6dc46d9edbbb333d4"; # pin
          sha256 = "1n7nv9j4hdfg3q6z40whmpcy6jqyaj4pccdfi55acpr4fk5nm84m";
        };

        checkPhase = ''
          runHook preCheck
          python -m unittest
          runHook postCheck
        '';
      }
    )

    (
      ps.buildPythonPackage {
        pname = "pynvim_pp";
        version = "unstable-2021-10-02";

        src = fetchFromGitHub {
          owner = "ms-jpq";
          repo = "pynvim_pp";
          rev = "dc6a82affc28422d5bf0cffad1a01a16822518eb"; # pin
          sha256 = "0av8y1bc7syccxay0181yqii19bxpldj31r9rhbyrjxqx1j90ryi";
        };

        propagatedBuildInputs = [ pynvim ];

        doCheck = false;
      }
    )
    pyyaml
  ];

  meta.homepage = "https://github.com/ms-jpq/coq_nvim";
})
