{ inputs, ... }:
{
  flake.devShells.x86_64-linux.default =
    let
      pkgs = inputs.nixpkgs-unstable.legacyPackages."x86_64-linux";
      python = pkgs.python3.withPackages (
        ps: with ps; [
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
      tex = pkgs.texlive.combined.scheme-medium;
    in
    pkgs.mkShell {
      packages = [
        pkgs.root
        python
        tex
        jq
        just
      ];
      shellHook = ''
        export PYTHONPATH="${pkgs.root}/lib:$PYTHONPATH"
        echo "ROOT $(root-config --version) environment ready"
      '';
    };
}
