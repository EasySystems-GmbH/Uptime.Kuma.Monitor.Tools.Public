#!/usr/bin/env bash
# Install unix rollout agent (agent-only edition — no standalone/master modes).
set -euo pipefail

PUBLIC_REPO="${PUBLIC_REPO:-EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public}"
REF="${REF:-main}"
INSTALL_DIR="${INSTALL_DIR:-/opt/unix-rollout-agent}"
SCRIPT_NAME="unix-monitor-agent.py"
REMOTE_PATH="apps/rollout-agent/unix/${SCRIPT_NAME}"
RAW_URL="https://raw.githubusercontent.com/${PUBLIC_REPO}/${REF}/${REMOTE_PATH}"

log() { printf '%s\n' "$*"; }
err() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

if [[ "$(id -u)" -ne 0 ]]; then
  err "Run as root: curl -fsSL \".../install-rollout.sh\" | sudo env PUBLIC_REPO=${PUBLIC_REPO} bash"
fi

if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
  err "curl or wget required."
fi

mkdir -p "${INSTALL_DIR}"
TARGET="${INSTALL_DIR}/${SCRIPT_NAME}"

log "Downloading rollout agent from ${RAW_URL}"
if command -v curl >/dev/null 2>&1; then
  curl -fsSL "${RAW_URL}" -o "${TARGET}"
else
  wget -qO "${TARGET}" "${RAW_URL}"
fi
chmod 700 "${TARGET}"

if ! head -n 120 "${TARGET}" | grep -q 'ROLLOUT_AGENT_BUILD = True'; then
  err "Downloaded file is not a rollout-agent build (ROLLOUT_AGENT_BUILD missing)."
fi

log "Installed rollout agent: ${TARGET}"
log "Start UI: python3 ${TARGET} --ui --host 0.0.0.0 --port 8787"
log "Or use Docker: see dev/apps/rollout-agent/docker-compose.yml"
