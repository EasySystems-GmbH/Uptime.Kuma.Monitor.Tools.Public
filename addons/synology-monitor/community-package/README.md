# EasySystems GmbH Synology Community Package (Basic SPK Skeleton)

This folder contains a **basic community package skeleton** for `synology-monitor` branded for EasySystems GmbH.

It is intentionally minimal, so you can adapt it to your DSM version and signing pipeline.

## Included

- `package/INFO` - package metadata
- `package/scripts/*` - install/uninstall/start/stop hooks
- `package/conf/*` - simple privilege/resource declarations
- `repo/packages.json` (Package Center source index)

Build and release tooling lives in the private dev repository (`Uptime.Kuma.Monitor.Tools.Dev`).

## Install (GitHub Package Source)

Use this if you do not want manual `.spk` upload each time.

1. Publish `synology-monitor-basic.spk` as a GitHub release asset in your repository.
2. Commit/push `addons/synology-monitor/community-package/repo/packages.json`.
3. In DSM: Package Center -> Settings -> Package Sources -> Add
4. Use this URL pattern as source:

```text
https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/addons/synology-monitor/community-package/repo/packages.json
```

5. Open your source in Package Center and install/update from there.

### Exact URLs for this repository

Use this URL in DSM Package Sources (this is the correct one):

```text
https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/addons/synology-monitor/community-package/repo/packages.json
```

Release asset URL expected by the package source:

```text
https://github.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/releases/latest/download/synology-monitor-basic.spk
```

### Direct download (manual install)

- **Latest:** `https://github.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/releases/latest/download/synology-monitor-basic.spk`
- **All versions:** `https://github.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/releases`

Important: this GitHub page URL is only for browsing files and will NOT work as DSM package source:

```text
https://github.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/tree/main/addons/synology-monitor/community-package
```

The package source JSON points to:

```text
https://github.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/releases/latest/download/synology-monitor-basic.spk
```

Release building and verification are managed from the private dev repository.

## Install (Manual Upload)

1. DSM > Package Center > Manual Install
2. Select `synology-monitor-basic.spk`
3. UI is auto-started by the package scripts (no SSH required)

Then open:
- `http://<nas-ip>:8787`

If needed, control it from Package Center (Start/Stop) for this package.

## UI Authentication (Required)

The package UI now enforces local authentication:

- single admin password
- mandatory TOTP 2FA (authenticator app)
- one-time recovery codes generated during setup

First UI visit requires security bootstrap before dashboard access.
After bootstrap, login is always password + TOTP (or a recovery code fallback).

### SMART helper

During installation, a root helper script is installed:

- `/var/packages/synology-monitor/target/smart-helper.sh`
- writes cache consumed by the package UI/check logic

The package now auto-installs headless root schedules:
- SMART helper refresh every 5 minutes
- System-log helper refresh every 5 minutes (for System diagnostics cache)
- Monitor scheduler tick every minute (respects configured interval in app settings)
This keeps checks running without any logged-in user/session.
Additionally, package service start launches a dedicated scheduler loop process as fallback if DSM cron is unavailable.
Manual DSM Task Scheduler setup remains optional as fallback.
After install/update, run one helper execution and then press "Check elevated access now" in the package UI to confirm status immediately.
The setup UI includes an "elevated access" status panel to confirm whether helper cache is active.
It also includes an "Auto-create task (beta)" button and status block (best-effort; manual UI setup remains fallback).
The setup UI includes embedded Task Scheduler screenshots to guide users through each step.

## Python dependency notes (UI auth)

Ensure these modules are available to the package Python runtime:

- `werkzeug` (password hashing)
- `pyotp` (TOTP verification)
- `qrcode` and `Pillow` (QR code generation for enrollment)

## Notes

- This package is a community baseline (no signing, no DSM wizard pages).
- For production distribution, add architecture-specific packaging and signatures.
- DSM 7.3 privilege policy requires package services to run as `package` user (not root).
- Build artifacts under `.build/` and `dist/` are generated and should not be committed.
- EasySystems GmbH: https://www.easysystems.ch/de
- Copyright: Copyright (c) 2026 EasySystems GmbH. All rights reserved.
