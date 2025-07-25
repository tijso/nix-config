{
  lib,
  config,
  ...
}:
with lib;
{
  options.myHome.cli.ssh.enable = mkEnableOption "Enable Ssh";
  config = mkIf config.myHome.cli.ssh.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = [ "~/.ssh/github" ]; # <--- Adjust this path
          identitiesOnly = true;
        };
      };

      # Optional: Any other SSH client config you want to add globally
      # extraConfig = ''
      #   Host *
      #     ServerAliveInterval 60
      # '';
    };
  };
}
