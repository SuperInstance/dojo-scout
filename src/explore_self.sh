#!/bin/bash
# Scout turns exploration inward — analyze own logs
echo "=== Self-Exploration Report ==="
echo ""
echo "Diary entries:"
ls DIARY/*.md 2>/dev/null | while read f; do echo "  $(basename $f)"; done
echo ""
echo "Achievements:"
ls ACHIEVEMENTS/*.md 2>/dev/null | while read f; do
  who=$(grep "^\- \*\*Who:\*\*" "$f" 2>/dev/null | head -1)
  echo "  $(basename $f) — $who"
done
echo ""
echo "Skills in SKILLS.md:"
grep "^\- \*\*" SKILLS.md 2>/dev/null | head -10
echo ""
echo "Tools built:"
ls src/ 2>/dev/null | while read f; do echo "  $f"; done
echo ""
echo "Commit history:"
git log --oneline -10 2>/dev/null
