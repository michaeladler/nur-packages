{
  lib,
  perlPackages,
  fetchFromGitHub,
  installShellFiles,
}:

perlPackages.buildPerlPackage {
  pname = "cinclude2dot";
  version = "unstable-2018-08-29";

  src = fetchFromGitHub {
    owner = "frabcus";
    repo = "cinclude2dot";
    rev = "b46ca398e6ba9fd11542a117a80b688a0f397a5b";
    sha256 = "0g3akry4f004dnc39301gih8mcs7xq37zw12b0vb7fyhxrymqi1i";
  };

  nativeBuildInputs = [ installShellFiles ];

  dontConfigure = true;

  outputs = [ "out" ];

  installPhase = ''
    install -D -m0755 cinclude2dot $out/bin/cinclude2dot
    installManPage cinclude2dot.1
  '';

  meta = with lib; {
    homepage = "https://github.com/frabcus/cinclude2dot";
    description = "Generate graphs of C/C++ #include dependencies";
    license = licenses.gpl2Only;
  };

}
