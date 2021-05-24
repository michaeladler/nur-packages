{ pkgs }:

pkgs.afew.overrideAttrs (old: rec {
  name = "afew-custom-${old.version}";
  patches =
    [ ./0001-Fix-MailMover.patch ./0002-Configurable-config-file-name.patch ];
})
