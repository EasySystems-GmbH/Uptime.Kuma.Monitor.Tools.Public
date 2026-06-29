# Rollout agent — build orchestration

Agent **installers and artifacts** live under each monitor app:

| App | Full edition | Agent edition |
| --- | --- | --- |
| Unix | `apps/unix-monitor/deploy/full-version/` | `apps/unix-monitor/deploy/agent-installation/` |
| Synology | `apps/synology-monitor/deploy/full-version/` | `apps/synology-monitor/deploy/agent-installation/` |
| Windows | `apps/windows-monitor/deploy/full-installation/` | `apps/windows-monitor/deploy/agent-installation/` |

This folder provides:

- `scripts/patch-source.py` — bake `ROLLOUT_AGENT_BUILD=True` into agent artifacts
- `docker/` — Unix agent container (GHCR `unix-rollout-agent`)
- `build-all.sh` — local maintainer build (all platforms)

**Playbook:** `./playbook build-rollout` patches sources, builds SPK + Windows agent EXE, syncs Public.

Legacy Public paths under `apps/rollout-agent/` are compatibility mirrors; prefer per-app `deploy/agent-installation/` URLs in new docs.
