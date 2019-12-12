#!/usr/bin/env bash

set -e
set -o pipefail
set -o xtrace

parse_environment_variables() {
  DIST_DIR=${DIST_DIR:?'DIST_DIR variable missing.'}
  SOURCE_DIR=${SOURCE_DIR:?'SOURCE_DIR variable missing.'}
  RSYNC_PATTERN=${RSYNC_PATTERN:?'RSYNC_PATTERN variable missing.'}
}

clean() {
  rm -rf "$DIST_DIR"
  mkdir -p "$DIST_DIR"
}

build() {
  pushd "${SOURCE_DIR}" >/dev/null || exit
  # shellcheck disable=SC2086
  rsync -Ravz ${RSYNC_PATTERN} --exclude="*" --exclude="*.*" "." "$DIST_DIR"
  popd >/dev/null || exit
}

parse_environment_variables
clean
build
