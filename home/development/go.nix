{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.development.go;
in
{
  options.modules.development.go.enable = mkEnableOption "Enable Go";
  config = mkIf cfg.enable {
    programs.go = {
      enable = true;
      package = pkgs.go;
      packages = { };
      goPath = "go";
      # goPrivate = ["*github.com/asanbilit/*" "*gitlab.iranairs.com/*"];
    };

    home.packages = with pkgs; [
      gofumpt
      golint
      richgo
      golangci-lint-langserver
      golangci-lint
      go-tools
      gopls
      godef
      gotools
      errcheck
      atlas
      sqlc
    ];

    home.sessionPath = [ "$HOME/go/bin" ];
  };
}
