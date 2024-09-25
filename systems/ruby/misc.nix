{ inputs, pkgs, ... }:
{
  # timezone
  time.timeZone = "Europe/Berlin";

  # locale
  i18n.defaultLocale = "en_US.UTF-8";

  # fwupd
  services.fwupd.enable = true;

  # console options
  console = {
  font = "Lat2-Terminus16";
  useXkbConfig = true; # use xkbOptions in tty.
  };
}
