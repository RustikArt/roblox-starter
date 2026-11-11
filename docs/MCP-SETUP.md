# Connecter l'agent IA à Roblox Studio (MCP)

Source officielle : https://create.roblox.com/docs/studio/mcp

Le serveur MCP est **intégré à Studio** : il tourne en local et parle à ton client IA par stdio. Il permet de lire l'arborescence, exécuter du Luau, lancer un playtest, lire la console, prendre des captures et simuler clavier/souris.

## 1. Activer le serveur dans Studio
Assistant → **…** → **Manage MCP Servers** → activer **Enable Studio as MCP server**. Un indicateur vert avec le nombre de clients connectés apparaît quand ça marche.

## 2a. GitHub Copilot dans VS Code (le plus simple)
Visual Studio Code fait partie des clients de la « connexion rapide » :
Assistant Settings → **MCP Servers** → **Quick connect** → activer **Visual Studio Code**.
Puis redémarre VS Code. Dans le chat Copilot, passe en **mode Agent** et vérifie que les outils Roblox Studio apparaissent (icône des outils).

## 2b. Hermes Agent
Hermes n'est pas dans la connexion rapide : utilise la configuration manuelle. Ajoute dans `~/.hermes/config.yaml` (sous Windows natif : le dossier `.hermes` de ton profil) :

```yaml
mcp_servers:
  roblox_studio:
    command: "cmd.exe"
    args: ["/c", "%LOCALAPPDATA%\\Roblox\\mcp.bat"]
```

Puis, dans une session Hermes en cours : `/reload-mcp`. Test : `hermes mcp test roblox_studio`.
Si Hermes tourne dans WSL2 plutôt que sous Windows, la commande doit être adaptée : demande de l'aide avant d'insister.

## 3. Test de fumée
Demande à l'agent : « Liste les enfants de Workspace, lance un playtest, lis la console, puis arrête le playtest. »

## Dépannage (selon la documentation Roblox)
- Redémarre Studio **et** le client.
- Vérifie que le chemin de la commande existe.
- Vérifie la syntaxe JSON/YAML (une virgule ou une indentation fausse suffit à tout bloquer).

## Sécurité
- Connecte uniquement des clients de confiance : ils peuvent lire et modifier les places ouverts.
- Commit Git avant chaque session.
- Le MCP sert à observer et tester ; le code se modifie dans les fichiers du repo.
