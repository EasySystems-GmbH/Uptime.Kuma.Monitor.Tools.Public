# Rollout agent editions

Agent-only monitor builds for fleet rollout to a **hosted master**. These editions remove **standalone** and **master** peering modes — only **agent** role is available.

## Platforms

| Platform | Artifact | Enable rollout mode |
| --- | --- | --- |
| Unix/Linux | `dist/unix-monitor-agent.py` or Docker image | `ROLLOUT_AGENT_BUILD = True` (baked) or `ESYS_ROLLOUT_AGENT=1` |
| Synology DSM | `dist/synology-monitor-agent.spk` | baked in SPK |
| Windows | `dist/windows-rollout-agent/` | `-p:RolloutAgent=true` or `ESYS_ROLLOUT_AGENT=1` |
| Docker | `easysystems/unix-rollout-agent:<version>` | `ESYS_ROLLOUT_AGENT=1` in image |

## Build everything

```bash
cd dev/apps/rollout-agent
chmod +x build-all.sh docker/build-image.sh synology/build-spk-rollout.sh unix/install-rollout.sh
./build-all.sh
```

From repo root (recommended for releases — bumps version, builds SPK, syncs Public):

```bash
./playbook build-rollout
```

### Public install (curl)

```bash
curl -fsSL "https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/apps/rollout-agent/unix/install-rollout.sh" \
  | sudo env PUBLIC_REPO=EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public bash
```

Hosted fleet docs: `dev/apps/hosted-monitoring-solution/docs/agents/rollout-agent.md`

Optional env:

- `ROLLOUT_VERSION=1.12.0-rollout.1` — version stamped into patched Python sources and docker tag
- `SKIP_SYNOLOGY=1` / `SKIP_WINDOWS=1` — skip platform steps

## Docker only

```bash
./build-all.sh   # creates dist/unix-monitor-agent.py first
# or patch only:
python3 scripts/patch-source.py
./docker/build-image.sh 1.12.0-rollout.1
docker compose up -d
```

Open `http://localhost:8787`, complete auth setup, then configure master host + peering token under Settings.

## Windows

```powershell
.\windows\publish-rollout.ps1 -Version 1.7.1
```

## Full monitors vs rollout

The standard `unix-monitor`, `synology-monitor`, and `windows-monitor` packages keep all three peering roles. Rollout builds are separate artifacts under `dist/` — they are not overwritten in the main app trees unless you copy them manually.
