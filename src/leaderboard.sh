#!/bin/bash
# Scout's dojo leaderboard — compare all agents
echo "╔══════════════════════════════════════════════════╗"
echo "║          PLATO-OS DOJO LEADERBOARD              ║"
echo "╠══════════════════════════════════════════════════╣"
for repo in dojo-scout dojo-builder dojo-scribe dojo-alchemist; do
  commits=$(curl -s "https://api.github.com/repos/SuperInstance/$repo/commits?per_page=100" 2>/dev/null | python3 -c "import json,sys;print(len(json.load(sys.stdin)))" 2>/dev/null || echo 0)
  files=$(curl -s "https://api.github.com/repos/SuperInstance/$repo/git/trees/main?recursive=1" 2>/dev/null | python3 -c "import json,sys;d=json.load(sys.stdin);print(len([t for t in d.get('tree',[]) if t['type']=='blob']))" 2>/dev/null || echo 0)
  achievements=$(curl -s "https://api.github.com/repos/SuperInstance/$repo/contents/ACHIEVEMENTS" 2>/dev/null | python3 -c "import json,sys;d=json.load(sys.stdin);print(len([f for f in d if f['name'].endswith('.md') and f['name']!='README.md']))" 2>/dev/null || echo 0)
  printf "║ %-12s │ commits: %-3s │ files: %-3s │ achievements: %-2s ║\n" "${repo#dojo-}" "$commits" "$files" "$achievements"
done
echo "╚══════════════════════════════════════════════════╝"
