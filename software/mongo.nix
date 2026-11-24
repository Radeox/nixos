{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mongodb-tools

    # Fix for keyring not being used correctly
    (symlinkJoin {
      name = "mongodb-compass-wrapped";
      paths = [ mongodb-compass ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/mongodb-compass \
          --add-flags '--password-store="gnome-libsecret" --ignore-additional-command-line-flags'
      '';
    })
  ];
}
