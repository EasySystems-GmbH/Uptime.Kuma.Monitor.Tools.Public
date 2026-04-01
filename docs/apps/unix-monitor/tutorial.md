# unix-monitor Tutorial

## Prerequisites

- Access to an Uptime Kuma instance
- Required runtime dependencies for this app
- Network access to target systems (if applicable)

## Start Here

- Install with `apps/unix-monitor/install.sh` or run `python3 unix-monitor.py` directly.
- Choose mode (`standalone`, `master`, `agent`) before enabling scheduler.

## First Successful Run

- Launch the app once with minimal settings
- Confirm expected output or UI response
- Save a known-good baseline configuration

## Common Tasks

- Apply one small change at a time
- Verify monitor/notification results in Kuma
- Keep a rollback point before bulk changes

## Troubleshooting

- Re-check auth/token values and endpoint URLs
- Validate local runtime dependencies
- Review app logs and scheduler status

## Update And Rollback

- Update from the latest repository script/version
- If regressions occur, restore previous config and version
