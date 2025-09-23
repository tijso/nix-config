{
  lib,
  config,
  ...
}:
with lib; {
  options.myHome.cli.ssh.enable = mkEnableOption "Enable Ssh";
  config = mkIf config.myHome.cli.ssh.enable {
    programs.ssh = {
      enable = true;
      matchBlocks = {
        "*" = {
          addKeysToAgent = "yes";
          compression = true;
          serverAliveInterval = 0;
          serverAliveCountMax = 3;
          hashKnownHosts = true;
          userKnownHostsFile = "~/.ssh/known_hosts ~/.ssh/known_hosts2";
        };
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = ["~/.ssh/github"]; # <--- Adjust this path
          identitiesOnly = true;
        };
      };
    };
  };
}
