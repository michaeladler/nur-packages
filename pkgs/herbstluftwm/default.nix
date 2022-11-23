final: prev:

prev.herbstluftwm.overrideAttrs (old: {
  version = "unstable-2022-10-20";

  nativeBuildInputs = old.nativeBuildInputs ++
    (with prev; [
      asciidoc
      docbook_xml_dtd_45
      docbook_xsl
      libxslt.bin
    ]);

  src = final.fetchFromGitHub {
    owner = "herbstluftwm";
    repo = "herbstluftwm";
    rev = "5cc2914467985a9bb590c5bf3e0ab1fd5ff5fbb0";
    sha256 = "0q2r5b5iffagq751k1l45y0y59hfpmn0rwpzil43582phb9z0xby";
  };

  postPatch = old.postPatch + ''
    patchShebangs doc/format-doc.py
    patchShebangs doc/patch-manpage-xml.py
    substituteInPlace doc/patch-manpage-xml.py \
      --replace "xsltproc = 'xsltproc'" "xsltproc = '${prev.libxslt.bin}/bin/xsltproc'"
  '';

})
