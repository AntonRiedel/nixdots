{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    loadModels = [
      "llama3.2"
      "phi4"
    ];
    acceleration = false;
  };

  # environment.systemPackages = [
  #   pkgs.fabric-ai
  # ];
}
