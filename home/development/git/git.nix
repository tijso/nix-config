{
  lib,
  config,
  pkgs,
  ...
}:

with lib;
{
  options.git.enable = mkEnableOption "git settings";

  config = mkIf config.git.enable {
    home.packages = with pkgs; [
      git-gone # trim stale branches :: Cleanup stale Git branches of pull requests
      git-open # :: Type `git open` to open the GitHub page or website for a repository in your browser.
      git-bug # bug reporting right inside the repo :: Distributed, offline-first bug tracker embedded in git, with bridges
      git-workspace # workspace management
      codeberg-cli
      git-get # :: A better way to clone, organize and manage multiple git repositories
      gitleaks # :: Protect and discover secrets using Gitleaks
      git-graph # :: Command line tool to show clear git graphs arranged for your branching model
      git-ps-rs # :: Git Patch Stack command line interface, gps
      git-trim # :: Automatically trims your branches whose tracking remote refs are merged or stray
      # gitrs # :: A simple, opinionated, tool, written in Rust, for declaratively managing Git repos on your machine
      mani # :: CLI tool to help you manage multiple repositories
      # git-interactive-rebase-tool # :: Native cross platform full feature terminal based sequence editor for git interactive rebase
      stgit # :: A patch manager implemented on top of Git
    ];

    programs.git = {
      enable = true;
      package = pkgs.gitFull;
      userName = "Joey Sonnier";
      userEmail = "tijso@protonmail.com";
      aliases = {
        a = "!git add . && git status";
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit";
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
      };
    };
  };
}
