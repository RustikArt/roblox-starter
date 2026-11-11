---
description: Implémente une fonctionnalité de bout en bout (plan, code, vérifications, revue, playtest)
argument-hint: <description de la fonctionnalité>
---

Fonctionnalité demandée : $ARGUMENTS

Suis ce déroulé, sans sauter d'étape :
1. Lis CLAUDE.md, docs/GDD.md et docs/ARCHITECTURE.md. Résume en 5 lignes comment la fonctionnalité s'intègre.
2. Propose un plan court (fichiers touchés, données, remotes, risques d'exploit). Attends ma validation si le plan change l'architecture ou l'économie.
3. Implémente par petits incréments. Ajoute des tests Lune pour toute logique pure (dans tests/).
4. Lance `lune run check` jusqu'à ce que tout passe.
5. Lance le sous-agent `reviewer` et corrige les points BLOQUANT et IMPORTANT.
6. Si Studio est connecté, lance le sous-agent `playtester` sur le scénario principal.
7. Mets à jour docs/BACKLOG.md et, si une décision structurante a été prise, docs/DECISIONS.md. Propose un message de commit.
