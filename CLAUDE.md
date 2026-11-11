# Projet Roblox — instructions pour les agents IA

Langue : réponds en français. Code, identifiants et commentaires de code en anglais.

## Contexte
Jeu Roblox développé en Luau avec Rojo. **Git est la source de vérité** : tout ce qui est dans `src/` et `world/` se modifie dans les fichiers, pas directement dans Studio. Lis `docs/GDD.md` (design), `docs/ARCHITECTURE.md` (structure) et `docs/DECISIONS.md` (décisions déjà prises) avant toute tâche non triviale.

## Commandes
- `lune run check` : format, lint, types, tests, build. **Doit passer avant tout commit.**
- `lune run tests/run` : tests unitaires seuls (logique pure, sans API Roblox).
- `stylua src tests lune` : formate le code.
- `rojo serve` : synchronise `src/` vers Studio (plugin Rojo dans Studio, bouton Connect).
- `rojo build default.project.json -o build/game.rbxl` : construit le place.
- `wally install` : installe les paquets déclarés dans `wally.toml`.

## Architecture
- `src/shared/` → `ReplicatedStorage.Shared` : logique pure et config, utilisable des deux côtés.
- `src/server/` → `ServerScriptService.Server` : services serveur (point d'entrée `Main.server.luau`, services dans `Services/`).
- `src/client/` → `StarterPlayerScripts.Client` : UI, input, effets.
- `world/` : contenu de la carte (modèles Rojo). Ne le modifie que sur demande explicite.
- `tests/` : specs Lune pour la logique pure (`*.spec.luau`, à référencer dans `tests/run.luau`).

## Règles non négociables
1. **Serveur autoritaire** : l'économie, l'inventaire, les dégâts et la progression sont calculés et validés côté serveur. Le client ne fait que demander.
2. **Valide tout argument reçu d'un client** avec `RemoteGuard` (type, bornes, valeurs finies, taille des chaînes). Limite la fréquence des appels sensibles.
3. **`--!strict` partout**, types explicites aux frontières de modules.
4. **Logique pure séparée des API Roblox** pour pouvoir la tester avec Lune (modèle : `Economy.luau`).
5. Les valeurs d'équilibrage vivent dans `Config.luau` (ou des modules de données), pas dans la logique.
6. Pas de nouvelle dépendance sans le noter dans `docs/DECISIONS.md` (nom, version, raison).
7. Ne contourne jamais une vérification (`lune run check`) : corrige la cause.
8. Ne jamais écrire de clé API ou de secret dans le repo.

## Utilisation de Roblox Studio via MCP
- Avant une session qui modifie Studio : commit Git propre.
- Le MCP sert à **exécuter, tester, observer et inspecter**. Le code se modifie dans les fichiers (sinon Rojo l'écrasera).
- Tout contenu de carte créé dans Studio doit être exporté dans `world/` par l'humain (voir `docs/WORLD-AND-PUBLISHING.md`).
- Demande confirmation avant toute action destructive dans Studio (suppression d'instances, écrasement de la carte).

## Définition de « terminé »
`lune run check` vert · tests ajoutés pour la logique pure · revue par le sous-agent `reviewer` · playtest du scénario principal si Studio est connecté · `docs/BACKLOG.md` à jour.

## Sous-agents et commandes
Sous-agents : `designer`, `reviewer`, `playtester`. Commandes : `/new-game-plan`, `/feature`, `/review`, `/playtest`.
