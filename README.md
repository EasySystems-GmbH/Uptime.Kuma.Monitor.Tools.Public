# Uptime Kuma Monitor Tools (Public)

This is the public distribution/runtime repository.

## Quick Start

```bash
cd apps/kuma-management-console-deploy
cp -n .env.example .env
docker compose up -d
docker compose ps
```

Open `http://localhost:5080`.

## Install Monitors

| Application | Platform | Install |
|---|---|---|
| Unix Monitor | Linux, macOS | `curl -sL https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/apps/unix-monitor/install.sh \| sudo env PUBLIC_REPO=EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public bash` |
| Synology Monitor | Synology DSM | `curl -sL https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/apps/synology-monitor/install.sh \| env PUBLIC_REPO=EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public bash` |

## Structure

```text
.
├── apps/                      # Active runtime applications
│   ├── kuma-management-console-deploy/
│   ├── unix-monitor/
│   └── synology-monitor/
├── legacy/                    # Deprecated monitors (migration compatibility)
│   ├── mount-monitor/
│   └── unix-storage-monitor/
├── docs/
│   └── apps/                  # Tutorials per public app
├── scripts/                   # Migration helpers
└── addons/                    # Compatibility paths (legacy URLs)
```

## Start Here (Per Application)

- App tutorials index: `docs/apps/README.md`
- Each app README starts with:
  - entry point (`apps/<app>/`)
  - docs folder (`docs/apps/<app>/`)
  - tutorial (`docs/apps/<app>/tutorial.md`)
