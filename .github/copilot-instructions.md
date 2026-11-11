# Instructions pour Copilot (et tout agent)

Avant toute tâche non triviale, lis `CLAUDE.md` à la racine : il contient les commandes, l'architecture et les règles du projet (serveur autoritaire, validation des remotes avec RemoteGuard, `--!strict`, tests Lune pour la logique pure). Lis aussi `docs/GDD.md` et `docs/ARCHITECTURE.md`.

Règles essentielles :
- Réponds en français ; code et commentaires de code en anglais.
- Le code se modifie dans les fichiers (`src/`, `world/`), jamais directement dans Studio : Rojo écraserait les changements.
- Après chaque modification : lance `lune run check` et corrige jusqu'au vert.
- Ne contourne jamais une vérification, n'ajoute pas de dépendance sans la noter dans `docs/DECISIONS.md`, n'écris jamais de secret dans le repo.
