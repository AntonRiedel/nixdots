{
  ...
}:
{
  programs = {
    bash = {
      bashrcExtra = builtins.readFile ./bash-alice.sh;
    };
  };
}
