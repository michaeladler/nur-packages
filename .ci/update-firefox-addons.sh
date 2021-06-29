#!/bin/sh
echo "Updating firefox-addons"
exec nix run '.#firefox-addons-generator' -- pkgs/firefox-addons/addons.json pkgs/firefox-addons/generated-addons.nix
