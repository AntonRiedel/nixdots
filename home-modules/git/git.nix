{ pkgs, ... }:{
programs = {
  git = {
      enable = true;
      userEmail = "anton.riedel@cern.ch";
      userName = "Anton Riedel";
      extraConfig = {
      	credential.helper = "store";
      };
    };
    };
}
