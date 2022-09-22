final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-09-21";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "ba96af6fe4a720bb65aa8d1c53bcb6dd9289a4df";
    sha256 = "0y72kpz6mwf9zqsrdzq7m2pmxfz82zgvlqpsb8hc3xkd6k5304r8";
  };

})
