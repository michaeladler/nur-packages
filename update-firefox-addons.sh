#!/bin/sh
exec nix run '.#firefox-addons-generator' -- pkgs/firefox-addons/addons.json pkgs/firefox-addons/generated-addons.nix
