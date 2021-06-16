{ orig }:

orig.overrideAttrs (oa: rec {
  patches = (oa.patches or [ ]) ++
    [
      ./0001-Fix-MailMover.patch
      ./0002-Configurable-config-file-name.patch
    ];
})
