{ pkgs ? null }:

{
  overlays = {
    default = import ./overlays/common.nix;
    python = import ./overlays/python.nix;
  };
}
