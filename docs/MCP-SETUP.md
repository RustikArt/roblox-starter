# Connecter l'agent IA à Roblox Studio (MCP)

Roblox fournit un serveur MCP officiel intégré à Studio. La procédure exacte évolue : suis la page officielle https://create.roblox.com/docs/studio/mcp (« Connect to the Roblox Studio MCP server »).

## Principe
1. Ouvre Studio avec ton projet synchronisé (`rojo serve` + plugin Rojo).
2. Dans Studio, active le serveur MCP et utilise la connexion rapide proposée pour ton client (Claude Code, Codex CLI, Gemini CLI, Cursor, VS Code…).
3. Dans ton agent, vérifie que les outils Roblox Studio sont listés (lecture de l'arborescence, exécution de Luau, playtest, console, captures).
4. Test de fumée : demande à l'agent de lister les enfants de `Workspace` puis de lancer un playtest et de lire la console.

## Règles de sécurité
- Ne connecte que des clients de confiance : ils peuvent lire et modifier les places ouverts.
- Commit Git avant chaque session.
- Le MCP observe et teste ; le code se modifie dans les fichiers du repo.
