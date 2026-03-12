# Addons Index

Optional addon scripts that extend Uptime Kuma monitoring.

## Available addons

### Unix Monitor (Linux / macOS)

Full-featured monitor for Unix: mount health, SMART, storage, ping, port, DNS, backup checks. Web UI, peering (master/agent), systemd or cron.

- Docs: [addons/unix-monitor/README.md](unix-monitor/README.md)
- Install:
  ```bash
  curl -sL https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/addons/unix-monitor/install.sh | sudo env PUBLIC_REPO=EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public bash
  ```

### Synology Monitor

Monitors Synology NAS storage/RAID and SMART health.

- Docs: [addons/synology-monitor/README.md](synology-monitor/README.md)
- Community package: [addons/synology-monitor/community-package/README.md](synology-monitor/community-package/README.md)
- **Install options:**
  1. Script: `curl -sL https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/addons/synology-monitor/install.sh | env PUBLIC_REPO=EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public bash`
  2. Package Center: add source `repo/packages.json` → install from Package Center
  3. Package download: `https://github.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/releases/latest/download/synology-monitor-basic.spk` | `https://github.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/releases`

## Deprecated (migrate to unix-monitor)

| Addon | Status | Migration |
|-------|--------|-----------|
| mount-monitor | Deprecated | Run its install script; it offers automatic migration |
| unix-storage-monitor | Deprecated | Run its install script; it offers automatic migration |

Both deprecated addons redirect to unix-monitor. User data (monitors) is preserved during migration.

## Notes

- Addons are standalone tools.
- Each addon has its own config and optional scheduler.
- Install only the addon(s) you need.
