# Flatpak support. Include on machines that need it.
{ ... }: {
  flake.modules.nixos.flatpak = { ... }: {
    services.flatpak.enable = true;
  };
}
