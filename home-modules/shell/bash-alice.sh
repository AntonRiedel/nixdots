# === Environment variables ===
export ALICE="${HOME}/alice"
export ALIBUILD_WORK_DIR="${ALICE}/sw"

# === Alienv Helper ===
eval "$(alienv shell-helper)"

# === Recompile Function ===
recompile() {
	[ "$1" ] || {
		echo "Provide a package name"
		return 1
	}

	package="$1"
	branch="master"

	if [ "$2" ]; then
		branch="$2"
	else
		cd "${ALICE}/${package}" || return 1
		branch="$(git branch --show-current)"
		cd - >/dev/null || return 1
	fi

	target=""
	target_name="all"
	[ "$3" ] && {
		target="$3/"
		target_name="$3"
	}

	dir_pwd="$(pwd)"
	dir_build="${ALIBUILD_WORK_DIR}/BUILD/${package}-latest-${branch}/${package}"
	log="$(dirname "$dir_build")/log"
	log_err="$(dirname "$dir_build")/log_err"

	cd "$dir_build" || {
		echo "Could not enter $dir_build"
		return 1
	}

	direnv allow || {
		echo "Failed to allow direnv"
		return 1
	}
	eval "$(direnv export "$SHELL")"

	echo "Recompiling ${package}_${branch}_${target_name}..."
	start="$(date +%s)"
	ninja "${target}install" >"$log" 2>&1
	ec=$?
	end="$(date +%s)"

	echo "Compilation exited with: $ec"
	echo "See the log at: $log"

	if [ "$ec" != "0" ]; then
		grep -E "FAILED:|error:" "$log" >"$log_err"
		echo "See the errors at: $log_err"
	fi

	echo "Took $((end - start)) seconds."
	cd "$dir_pwd" || return 1

	return $ec
}

recompile-o2() { recompile "O2" "$1" "$2"; }
recompile-o2p() { recompile "O2Physics" "$1" "$2"; }
recompile-o2qc() { recompile "QualityControl" "$1" "$2"; }

# === Load Function ===
load() {
  # Check argument
  if [ -z "$1" ]; then
    echo "Usage: load <package> [branch]"
    return 1
  fi

  package="$1"
  package_dir="${ALICE}/${package}"

  if [ ! -d "$package_dir" ]; then
    echo "Package directory not found: $package_dir"
    return 1
  fi

  # Go to package directory
  cd "$package_dir" || return 1

  # Determine branch: use $2 if provided, otherwise use fzf
  if [ -n "$2" ]; then
    branch="$2"
  else
    branches=$(git branch --format='%(refname:short)' | sort -u)

    if [ -z "$branches" ]; then
      echo "No branches found in $package_dir"
      cd - >/dev/null || return 1
      return 1
    fi

    branch=$(echo "$branches" | fzf --prompt="Select branch for $package: " --height=20 --border)

    if [ -z "$branch" ]; then
      echo "No branch selected."
      cd - >/dev/null || return 1
      return 1
    fi
  fi

  cd - >/dev/null || return 1

  # Construct environment name
  env_name="${package}-latest-${branch}-o2"

  echo "→ Entering environment: $env_name"
  sleep 0.2
  alienv enter "$env_name"
}

load-o2() { load "O2" "$1"; }
load-o2p() { load "O2Physics" "$1"; }
load-o2qc() { load "QualityControl" "$1"; }
