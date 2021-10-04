{ fetchFromGitHub, vimUtils }:

vimUtils.buildVimPluginFrom2Nix ({
  pname = "coq-nvim";
  version = "unstable-2021-10-03";
  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "coq_nvim";
    rev = "b9bab2ecf4c70fdc9b977b5abf82d2ac6e3c9478"; # coq
    sha256 = "09jayb5c1d98b357ab9fwp1xg6ph81s001as59a0yjmssrwsfr71";
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
          # sync with https://github.com/ms-jpq/coq_nvim/blob/coq/requirements.txt
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
        version = "unstable-2021-09-26";

        src = fetchFromGitHub {
          owner = "ms-jpq";
          repo = "pynvim_pp";
          # sync with https://github.com/ms-jpq/coq_nvim/blob/coq/requirements.txt
          rev = "5f95e0c88cfdbb9762475b4866d7d3c47bb0629f"; # pin
          sha256 = "00gacvnvg0ya5bad2ik0zd70m0bn9zp0bnjpyy170759qy3kp32h";
        };

        propagatedBuildInputs = [ pynvim ];

        doCheck = false;
      }
    )
    pyyaml
  ];

  meta.homepage = "https://github.com/ms-jpq/coq_nvim";
})
