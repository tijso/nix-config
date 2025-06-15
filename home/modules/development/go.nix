{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
{
  options.myHome.development.go.enable = mkEnableOption "Enable Go";
  config = mkIf config.myHome.development.go.enable {
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
