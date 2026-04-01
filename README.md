# Uptime Kuma Monitor Tools (Public)

This is the public distribution/runtime repository.

## Start Here (Per Application)

- App tutorials index: `docs/apps/README.md`
- Each app README starts with:
<<<<<<< HEAD
  - entry point (`apps/<app>/`)
  - docs folder (`docs/apps/<app>/`)
  - tutorial (`docs/apps/<app>/tutorial.md`)

## Quick Start
=======
  - entry point (`apps/{app}/`)
  - docs folder (`docs/apps/{app}/`)
  - tutorial (`docs/apps/{app}/tutorial.md`)

## Installation (By Application)

### Install Kuma Management Console (Docker)
>>>>>>> d906a0a (docs(readme): reorganize install guidance by application)

```bash
cd apps/kuma-management-console-deploy
cp -n .env.example .env
docker compose up -d
docker compose ps
```

Open `http://localhost:5080`.

### Install Unix Monitor

```bash
curl -sL https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/apps/unix-monitor/install.sh | sudo env PUBLIC_REPO=EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public bash
```

### Install Synology Monitor (Preferred: Package Center)

Use DSM Package Center with this package source URL:

```text
https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/apps/synology-monitor/community-package/repo/packages.json
```

Alternative (advanced): script install via `curl`.

```bash
curl -sL https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/apps/synology-monitor/install.sh | env PUBLIC_REPO=EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public bash
```

Warning: on Synology DSM, direct script installs can be affected by DSM updates and may require manual repair/reinstall. Package Center install is safer and recommended.

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
