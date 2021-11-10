final: prev:

prev.fzf.overrideAttrs (oa: {

  postInstall = oa.postInstall + ''
    mkdir -p $out/libexec
    mv $out/bin/fzf $out/libexec/fzf
    cat <<EOF > $out/bin/fzf
    #!/bin/sh
    if [ -d \$HOME/.config/fzf ]; then
      for f in "\$HOME"/.config/fzf/*.env; do
          . "\$f"
      done
    fi
    $out/libexec/fzf "\$@"
    EOF
    chmod 0755 $out/bin/fzf
  '';

})
