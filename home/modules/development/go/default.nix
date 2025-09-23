{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.myHome.development.go.enable = mkEnableOption "Enable Go";
  config = mkIf config.myHome.development.go.enable {
    programs.go = {
      enable = true;
      package = pkgs.go;
      packages = {};
      env.GOPATH = "go";
      # goPrivate = ["*github.com/asanbilit/*" "*gitlab.iranairs.com/*"];
    };

    home.packages = with pkgs; [
      gofumpt
      golint
      richgo
      golangci-lint-langserver
      golangci-lint
      gopls
      godef
      errcheck
      atlas
      sqlc
    ];

    home.sessionPath = ["$HOME/go/bin"];
  };
}
