# Testing — robot

This repo is a fork of `waveshareteam/ugv_jetson`. CI only exercises the
project's **own** additions under `ugv_server/` (the LIDAR SLAM / pose code),
not the vendored Flask app. Serial/camera hardware is not required.

## What's covered

| Area | Where |
|------|-------|
| LIDAR pose estimator (ICP + PCA + incremental mapping) smoke test | `ugv_server/scripts/test_lidar_pose.py` → `ugv_server/lidar_pose.py` |

The harness builds a synthetic rectangular map, transforms it by a known pose,
and runs ICP/PCA/mapping end to end. CI treats it as a **smoke test**: it must
run to completion without raising. (It prints estimated-vs-true pose errors but
does not yet assert tolerances — see "Next steps".)

## Run locally

```bash
# From the robot/ repo root, with numpy installed:
python3 ugv_server/scripts/test_lidar_pose.py
```

## CI

`.github/workflows/ci.yml` runs on every push/PR: real-error flake8 (blocking)
on the original modules, style flake8 (advisory), `compileall` of `ugv_server`,
and the LIDAR pose smoke test.

## Next steps

- Turn the smoke test into assertion-based tests: seed the RNG and assert the
  ICP pose error stays under a tolerance (e.g. `< 0.05 m`, `< 2°`) on a
  noise-free scan. Requires a local `numpy` run to set realistic thresholds.
