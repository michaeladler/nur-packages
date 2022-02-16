final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-15";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "87167cb290232d1cb980629981f5a335135dbc4a";
    sha256 = "05s3p76ss38kmh31sk6hjsm7yf6c8yhza3dynfi72v70xhpd25bk";
  };

})
