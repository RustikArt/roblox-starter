# Workflow quotidien

## La boucle
1. **Concevoir** : `/new-game-plan <idée>` remplit `docs/GDD.md` et le backlog. Tu valides le périmètre.
2. **Construire** : `/feature <description>` — plan, code, tests, `lune run check`, revue, playtest.
3. **Observer** : joue toi-même 10 minutes. Aucun agent ne remplace ça pour juger le plaisir de jeu.
4. **Décider** : ajuste `Config.luau` (équilibrage), le GDD, ou abandonne selon les métriques.
5. **Publier** : voir `docs/WORLD-AND-PUBLISHING.md`.

## Hygiène Git
- Une branche par fonctionnalité, commits petits, message clair.
- Commit propre avant chaque session d'agent qui touche Studio.
- Plusieurs agents en parallèle : `git worktree add ../mon-jeu-feature-x feature-x`, un agent par worktree.

## Ce que tu gardes sous contrôle
Le GDD, les changements d'économie, les décisions d'architecture, la carte, la mise en ligne, les dépenses (abonnements, assets payants).

## Quand l'agent se trompe
Donne-lui le message d'erreur exact ou la sortie de `lune run check`. Si une erreur revient, ajoute une règle dans `CLAUDE.md` : c'est ainsi que l'environnement s'améliore avec le temps.
