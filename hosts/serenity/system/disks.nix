{...}: {
  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/DA5CBB655CBB3AD9";
    mountPoint = "/mnt/windows";
    fsType = "auto";
    options = [
      "users"
      "nofail"
    ];
  };
}
