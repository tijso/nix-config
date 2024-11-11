{
  pkgs,
  lib,
  ...
}: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        enabled-extensions = [
          pkgs.gnomeExtensions.gsconnect.extensionUuid

          # Alternatively, you can manually pass UUID as a string.
          "blur-my-shell@aunetx"
          # ...
        ];
      };

      # Configure individual extensions
      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };
    };
  };
}
