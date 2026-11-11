---
description: Implémente une fonctionnalité de bout en bout (plan, code, vérifications, revue, playtest)
agent: agent
---

Fonctionnalité demandée : ${input:feature:Décris la fonctionnalité}

Suis ce déroulé, sans sauter d'étape :
1. Lis `CLAUDE.md`, `docs/GDD.md` et `docs/ARCHITECTURE.md`. Résume en 5 lignes comment la fonctionnalité s'intègre.
2. Propose un plan court (fichiers touchés, données, remotes, risques d'exploit). Attends ma validation si le plan change l'architecture ou l'économie.
3. Implémente par petits incréments. Ajoute des tests Lune pour toute logique pure (dans `tests/`, référencés dans `tests/run.luau`).
4. Lance `lune run check` jusqu'à ce que tout passe.
5. Fais une revue avec un regard neuf en appliquant `.github/agents/reviewer.agent.md` sur `git diff` ; corrige les points BLOQUANT et IMPORTANT.
6. Si Studio est connecté en MCP, fais un playtest du scénario principal en appliquant `.github/agents/playtester.agent.md`.
7. Mets à jour `docs/BACKLOG.md` (et `docs/DECISIONS.md` si décision structurante). Propose un message de commit.
