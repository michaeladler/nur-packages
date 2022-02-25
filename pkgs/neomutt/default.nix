final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-23";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "42e4ad8b0839a419d632c20477f26f901a937853";
    sha256 = "0h4c3j02vgzqivaxidi4whdkp7mj993496sbi9hkahd723bxggg7";
  };

})
