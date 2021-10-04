#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

DEFAULTNIX="$SCRIPT_DIR/default.nix"

REQS=$(curl -Ls https://raw.githubusercontent.com/ms-jpq/coq_nvim/coq/requirements.txt)

std2_rev=$(basename "$(echo "$REQS" | grep '^std2')" | sed -s 's/\.tar\.gz//')
pynvim_pp_rev=$(basename "$(echo "$REQS" | grep '^pynvim_pp')" | sed -s 's/\.tar\.gz//')

awk -v "std2_rev=$std2_rev" '{
  if(match($0, /repo = "std2"/)){
    l = NR;
    print $0
  } else if(l>0 && NR == l+1){
    printf "          rev = \"%s\"; # pin\n", std2_rev
    l = 0;
  } else {
    print $0
  }
}' <"$DEFAULTNIX" >"$DEFAULTNIX.new"
mv "$DEFAULTNIX.new" "$DEFAULTNIX"

awk -v "pynvim_pp_rev=$pynvim_pp_rev" '{
  if(match($0, /repo = "pynvim_pp"/)){
    l = NR;
    print $0
  } else if(l>0 && NR == l+1){
    printf "          rev = \"%s\"; # pin\n", pynvim_pp_rev
    l = 0;
  } else {
    print $0
  }
}' <"$DEFAULTNIX" >"$DEFAULTNIX.new"
mv "$DEFAULTNIX.new" "$DEFAULTNIX"

update-nix-fetchgit "$DEFAULTNIX"
