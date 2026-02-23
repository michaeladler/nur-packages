final: prev:

prev.bogofilter.overrideAttrs (oldAttrs: {
  buildInputs = oldAttrs.buildInputs ++ [ final.sqlite ];

  configureFlags = [
    "--enable-transactions"
    "--with-database=sqlite"
  ];
})
