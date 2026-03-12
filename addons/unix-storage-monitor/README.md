# Unix Storage Monitor — DEPRECATED

> **This addon is deprecated.** Use [unix-monitor](../unix-monitor/README.md) instead.

unix-monitor includes everything unix-storage-monitor did (SMART + storage) plus mount monitoring, web UI, and peering.

## Migration

If you run the install script, it will detect an existing install and offer to migrate automatically:

```bash
curl -sL https://raw.githubusercontent.com/EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public/main/addons/unix-storage-monitor/install.sh | env PUBLIC_REPO=EasySystems-GmbH/Uptime.Kuma.Monitor.Tools.Public bash
```

Your monitors will be preserved and migrated to unix-monitor.

## New installs

If you run the install script without an existing install, it will suggest installing unix-monitor instead.

---

*Last supported version: 1.0.0*
