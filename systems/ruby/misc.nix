{ inputs, pkgs, ... }:
{
  # timezone
  time.timeZone = "Europe/Berlin";

  # locale
  i18n.defaultLocale = "en_US.UTF-8";

  # fwupd
  services.fwupd.enable = true;
}
