# Release Notes

## 1.0.0-0056 (2026-03-09)

- Fixed Overview context reset in both `synology-monitor` and `unix-monitor` so selected agent/source is preserved after update checks and other POST actions.
- Preserved full UI context (`view`, `diag_view`, `log_filter`, and source) across async form handling and URL updates.
- Bumped runtime version tags in both addons to `1.0.0-0056`.
- Updated Synology package metadata version in `community-package/package/INFO` to `1.0.0-0056`.
- Built Synology SPK artifact: `synology-monitor-basic.spk`.
