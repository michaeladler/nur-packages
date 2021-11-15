final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-14";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "06110ff7ef13e5c84054278e5a57d61ad102da1c";
    sha256 = "0hzy6c8jzfc1fq9h58iiw31jvvfbd5rx7sy0fgl782qx8f1kvskp";
  };

})
