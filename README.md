# Roblox AI Starter Kit

Environnement de développement Roblox piloté par l'IA : Git comme source de vérité, Rojo pour synchroniser avec Studio, un agent IA qui écrit le code **et** teste le jeu dans Studio via MCP, une CI qui garde la qualité.

## Démarrage (15 minutes)

1. Installe : [VS Code](https://code.visualstudio.com), [Git](https://git-scm.com), [Roblox Studio](https://create.roblox.com).
2. Dans ce dossier :
   - macOS / Linux : `./scripts/setup.sh`
   - Windows (PowerShell) : `./scripts/setup.ps1`

   Le script installe Rokit, qui installe toute la toolchain figée dans `rokit.toml`. Après l'installation de Rokit, ouvre un nouveau terminal et relance le script.
3. Ouvre le dossier dans VS Code et accepte les extensions recommandées (Luau LSP, StyLua, Selene, Rojo).
4. Vérifie : `lune run check` doit afficher `All checks passed.`
5. Dans Studio : installe le plugin Rojo, ouvre un nouveau place, lance `rojo serve` dans le terminal, puis clique sur Connect dans le plugin.
6. Connecte l'agent IA à Studio : voir `docs/MCP-SETUP.md`.
7. Lance ton agent (ex. Claude Code) dans le dossier, puis essaie : `/new-game-plan <ton idée de jeu>`.

## Structure

| Chemin | Rôle |
|---|---|
| `src/` | Code du jeu (shared / server / client) |
| `world/` | Contenu de la carte, versionné |
| `tests/` | Tests unitaires Lune |
| `lune/check.luau` | Toutes les vérifications en une commande |
| `docs/` | GDD, architecture, décisions, backlog, workflow, publication |
| `.claude/` | Sous-agents, commandes, permissions, hooks |
| `CLAUDE.md` / `AGENTS.md` | Instructions lues par les agents |
| `.github/workflows/` | CI et publication manuelle via Open Cloud |

## Nouveau jeu à partir de ce template
Publie ce dossier comme repo template sur GitHub, puis `gh repo create mon-jeu --template <toi>/roblox-ai-starter`. Renomme `MyGame` dans `default.project.json`, `src/shared/Config.luau` et `wally.toml`.

## Pour aller plus loin
`docs/WORKFLOW.md` (la boucle quotidienne) · `docs/WORLD-AND-PUBLISHING.md` (carte et mise en ligne) · `docs/LAUNCH-CHECKLIST.md` (métriques et monétisation).
