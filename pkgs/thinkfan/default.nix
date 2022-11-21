final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-11-20";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "ba6185351022b6ca39c604b3e3ba598e035d89c4";
    sha256 = "07azpy49wmdnsq2w0ylap6wjs3pxki0gq6d534gva56z4qrrvsfp";
  };

})
