{pkgs, ...}: {
  flake.devShells.x86_64-linux.nixroot = let
    python = pkgs.python3.withPackages (
      ps:
        with ps; [
          numpy
          scipy
          matplotlib
          sympy
          awkward
          pandas
          uproot
          jupyterlab
        ]
    );
    tex = pkgs.texliveSmall;
  in
    pkgs.mkShell {
      packages = [
        pkgs.root
        pkgs.jq
        pkgs.just
        pkgs.clang-tools
        pkgs.cpplint
        pkgs.cppcheck
        pkgs.black
        pkgs.shfmt
        python
        tex
        pkgs.git-latexdiff
      ];
      shellHook = ''
        export PYTHONPATH="${pkgs.root}/lib:$PYTHONPATH"
        echo "ROOT $(root-config --version) environment ready"
      '';
    };
}
