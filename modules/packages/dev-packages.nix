{ ... }:
{
  flake.modules.homeManager.dev-packages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # formatters & linters
        stylua
        shfmt
        nixfmt
        black
        clang-tools
        cpplint
        cppcheck

        # language servers
        pyright
        lua-language-server
        bash-language-server
        nixd
        texlab
        ltex-ls
      ];
    };
}
