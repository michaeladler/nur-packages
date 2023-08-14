final: prev:

prev.srandrd.overrideAttrs (old: {
  version = "unstable-2023-08-13";

  src = prev.fetchFromGitHub {
    owner = "jceb";
    repo = "srandrd";
    rev = "640f3e3274feed34bf76ea765ae3832a1bea654e";
    sha256 = "0k1fid55hap9cjjh5sr18wn3w0yvdzqz3ka1x63hhd6sl1bavzsr";
  };

  patches = [
    ./debounce.patch
  ];

})
