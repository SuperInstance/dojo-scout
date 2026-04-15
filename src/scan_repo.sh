#!/bin/bash
REPO_URL="$1"
DIRNAME=$(basename "$REPO_URL" .git)
git clone --depth 1 "$REPO_URL" /tmp/scan-$DIRNAME 2>/dev/null
echo "=== $DIRNAME ==="
echo "Files: $(find /tmp/scan-$DIRNAME -not -path '*/\.git/*' -type f | wc -l)"
echo "Has SKILLS: $([ -f /tmp/scan-$DIRNAME/SKILLS.md ] && echo YES || echo NO)"
echo "Has TESTS: $([ -d /tmp/scan-$DIRNAME/tests ] && echo YES || echo NO)"
rm -rf /tmp/scan-$DIRNAME
