{ pkgs, ... }:
{

  # timezone
  time.timeZone = "Europe/Berlin";

  # locale
  i18n.defaultLocale = "en_US.UTF-8";

  # fwupd
  services.fwupd.enable = true;

  # auto-cpufreq
  services.auto-cpufreq.enable = true;

  # virtualization
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      ovmf = {
        enable = true;
	packages = [ pkgs.OVMFFull.fd ];
      };
    };
  };

  # setup dual function keys
  services.interception-tools = {
    enable = true;
    plugins = [ pkgs.interception-tools-plugins.dual-function-keys ];
    udevmonConfig = ''
- JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.dual-function-keys}/bin/dual-function-keys -c /etc/dual-function-keys.yaml | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
  DEVICE:
    NAME: ".*[Kk]eyboard.*"
    '';
  };
  environment.etc."dual-function-keys.yaml".text = builtins.readFile ./dual-function-keys.yaml;

  # console options
  console = {
  font = "Lat2-Terminus16";
  useXkbConfig = true; # use xkbOptions in tty.
  };

  # add zsh shell
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];
}
