{
  ...
}:
{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
                eval "$(alienv shell-helper)"

                recompile() {
                # set -o xtrace # to print out each command
                [ "$1" ] || { echo "Provide a package name"; return 1; }
                package="$1"
                branch="master"
                if [ "$2" ]; then
                branch="$2"
                else
                cd ${ALICE}/${package}
                branch="$(git branch --show-current)"
        	cd -
                fi
                target=""
                target_name="all"
                [ "$3" ] && { target="$3/"; target_name="$3"; }
                dir_pwd=$(pwd)
                dir_build="$ALIBUILD_WORK_DIR/BUILD/${package}-latest-${branch}/${package}"
                log="$(dirname "$dir_build")/log"
                log_err="$(dirname "$dir_build")/log_err"
                cd "$dir_build" || { echo "Could not enter $dir_build"; return 1; }
                direnv allow || { echo "Failed to allow direnv"; return 1; }
                eval "$(direnv export "$SHELL")"
                echo "Recompiling ${package}_${branch}_${target_name}..."
                start=$(date +%s)
                ninja "${target}install" > "$log" 2>&1
                ec=$?
                end=$(date +%s)
                echo "Compilation exited with: $ec"
                echo "See the log at: $log"
                if [ "$ec" != "0"  ]; then
                grep -e "FAILED:" -e "error:" "$log" > "$log_err"
                echo "See the errors at: $log_err"
                fi
                echo "Took $((end - start)) seconds."
                cd "$dir_pwd" || return 1
                # set +o xtrace
                return $ec
                }
      '';
    };
  };
  home.sessionVariables = {
    ALICE = "~/alice";
    ALIBUILD_WORK_DIR = "$ALICE/sw";
  };
  home.shellAliases = {
    ls = "ls --color";
    loado2 = "alienv enter O2/latest";
    loado2p = "alienv enter O2Physics/latest";
    loado2qc = "alienv enter QualityControl/latest";
    recompile-o2p = ''recompile "O2Physics" "$1" "$2"'';
    recompile-o2qc = ''recompile "QualityControl" "$1" "$2"'';

  };
}
