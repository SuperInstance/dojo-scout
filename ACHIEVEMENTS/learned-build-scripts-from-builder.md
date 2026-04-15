# Learned: Build Script Pattern

## Source
- **Who:** Builder (dojo-builder)
- **Where:** Examined their repo structure
- **When:** 2026-04-15

## What They Figured Out
Builder puts executable tools in `src/` with clear names. Each script does ONE thing.

## How I Adapted It
I created `src/scan_repo.sh` for repo analysis. Same pattern (one tool, one job) but applied to my domain (exploration).

## What It Unlocked
I can now systematically explore repos instead of just browsing.
