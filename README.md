# Roblox AI Starter Kit

Environnement de développement Roblox piloté par l'IA : Git comme source de vérité, Rojo pour synchroniser avec Studio, un agent IA qui écrit le code **et** teste le jeu dans Studio via MCP, une CI qui garde la qualité.

## Démarrage (15 minutes)

1. Installe : [VS Code](https://code.visualstudio.com), [Git](https://git-scm.com), [Roblox Studio](https://create.roblox.com).
2. Dans ce dossier :
   - macOS / Linux : `./scripts/setup.sh`
   - Windows (PowerShell) : `powershell -ExecutionPolicy Bypass -File .\scripts\setup.ps1` (Windows bloque les scripts téléchargés non signés : cette commande autorise uniquement ce lancement-ci)

   Le script installe Rokit, qui installe toute la toolchain figée dans `rokit.toml`. Après l'installation de Rokit, ouvre un nouveau terminal et relance le script.
3. Ouvre le dossier dans VS Code et accepte les extensions recommandées (Luau LSP, StyLua, Selene, Rojo).
4. Vérifie : `lune run check` doit afficher `All checks passed.`
5. Dans Studio : installe le plugin Rojo, ouvre un nouveau place, lance `rojo serve` dans le terminal, puis clique sur Connect dans le plugin.
6. Connecte l'agent IA à Studio : voir `docs/MCP-SETUP.md` (Copilot dans VS Code : connexion rapide ; Hermes : config manuelle).
7. Lance ton agent dans le dossier (chat Copilot en mode Agent, Hermes, Claude Code…), puis essaie la commande `/new-game-plan` avec ton idée de jeu.

## Structure

| Chemin | Rôle |
|---|---|
| `src/` | Code du jeu (shared / server / client) |
| `world/` | Contenu de la carte, versionné |
| `tests/` | Tests unitaires Lune |
| `lune/check.luau` | Toutes les vérifications en une commande |
| `docs/` | GDD, architecture, décisions, backlog, workflow, publication |
| `.github/` (prompts, agents, instructions) | Commandes et rôles pour Copilot |
| `.claude/` | Mêmes rôles et commandes pour Claude Code, permissions, hooks |
| `CLAUDE.md` / `AGENTS.md` | Instructions lues par les agents |
| `.github/workflows/` | CI et publication manuelle via Open Cloud |

## Nouveau jeu à partir de ce template
Publie ce dossier comme repo template sur GitHub, puis `gh repo create mon-jeu --template <toi>/roblox-ai-starter`. Renomme `MyGame` dans `default.project.json`, `src/shared/Config.luau` et `wally.toml`.

## Pour aller plus loin
`docs/WORKFLOW.md` (la boucle quotidienne) · `docs/WORLD-AND-PUBLISHING.md` (carte et mise en ligne) · `docs/LAUNCH-CHECKLIST.md` (métriques et monétisation).
