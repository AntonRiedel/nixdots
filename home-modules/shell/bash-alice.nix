{
  ...
}:
{
  programs = {
    bash = {
      bashrcExtra = builtins.readFile ./bash-alice.rc;
    };
  };
}
