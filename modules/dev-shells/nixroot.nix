{inputs, ...}: {
  flake.devShells.x86_64-linux.nixroot = let
    pkgs = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
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
    tex = pkgs.texlive.combined.scheme-full;
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
