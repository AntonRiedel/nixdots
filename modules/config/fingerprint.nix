{...}: {
  flake.modules.nixos.fingerprint = {pkgs, ...}: {
    services.fprintd.enable = true;
    security.pam.services = {
      sudo.fprintAuth = true;
      polkit-1.fprintAuth = true;
      greetd.fprintAuth = false;
    };
  };
}
