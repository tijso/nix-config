{
  pkgs,
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
    };

    # Add this service to ensure SSH agent starts with your session
    systemd.user.services.ssh-agent = {
      Unit = {
        Description = "SSH key agent";
        Before = [ "graphical-session-pre.target" ];
        Wants = [ "graphical-session-pre.target" ];
      };
      Service = {
        Type = "forking";
        Environment = "SSH_AUTH_SOCK=%t/ssh-agent.socket";
        ExecStart = "${pkgs.openssh}/bin/ssh-agent -a $SSH_AUTH_SOCK";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
