#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
APP_DIR="$ROOT_DIR/app"
DIST_DIR="$ROOT_DIR/dist"
ARCHIVE_NAME="geckodm-extension.zip"
ARCHIVE_PATH="$DIST_DIR/$ARCHIVE_NAME"

if [[ ! -d "$APP_DIR" ]]; then
  echo "error: app directory not found at $APP_DIR" >&2
  exit 1
fi

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

(
  cd "$APP_DIR"
  zip -r "$ARCHIVE_PATH" . -x '*.DS_Store' -x '__MACOSX/*' >/dev/null
)

echo "Created $ARCHIVE_PATH"
