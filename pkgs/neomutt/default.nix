final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-03-03";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "e12ab809abdba566da5b480303a3c777a8a83b89";
    sha256 = "0zrv50i5l2zbljh2lwx5g6vxvjw69m3jl2dh4qc4fmglkjcv31d3";
  };

})
