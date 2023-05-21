let
  outputs = builtins.getFlake (toString ./.);
in
outputs.legacyPackages.x86_64-linux.lqxPackages.kernel
