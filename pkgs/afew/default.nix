{ orig }:

orig.overrideAttrs (oa: rec {
  patches = (if builtins.hasAttr "patches" oa then oa.propagatedBuildInputs else [ ]) ++
    [
      ./0001-Fix-MailMover.patch
      ./0002-Configurable-config-file-name.patch
    ];
})
