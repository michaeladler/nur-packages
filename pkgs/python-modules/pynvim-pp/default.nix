{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonPackage {
  pname = "pynvim_pp";
  version = "unstable-2021-09-26";

  src = fetchFromGitHub {
    owner = "ms-jpq";
    repo = "pynvim_pp";
    # sync with https://github.com/ms-jpq/coq_nvim/blob/coq/requirements.txt
    rev = "5f95e0c88cfdbb9762475b4866d7d3c47bb0629f"; # pin
    sha256 = "00gacvnvg0ya5bad2ik0zd70m0bn9zp0bnjpyy170759qy3kp32h";
  };

  propagatedBuildInputs = [ python3.pkgs.pynvim ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/ms-jpq/pynvim_pp";
    description = "pynvim extension";
    license = "unknown";
  };
}
