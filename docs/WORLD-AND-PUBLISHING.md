# Carte (world) et publication

## Pourquoi la carte est dans le repo
La publication via Open Cloud envoie un fichier place **complet** : il remplace le contenu du place en ligne. Si la carte n'est que dans ton Studio, une publication automatique l'écrase. Le repo doit donc contenir tout le jeu.

## Contenu de la carte
- `world/Map.model.json` : carte de départ (un sol et un point d'apparition), modifiable à la main ou par l'agent.
- Pour une vraie carte construite dans Studio : sélectionne le dossier `Map` → clic droit → *Save to File…* → enregistre `world/Map.rbxm`, puis dans `default.project.json` remplace `world/Map.model.json` par `world/Map.rbxm`. Commit.
- Garde chaque grande zone dans un fichier séparé pour limiter les conflits Git.

## Limites de la publication par API
D'après la documentation Roblox, l'API ne met pas à jour certains types d'instances (EditableImage, EditableMesh, PartOperation, SurfaceAppearance, BaseWrap). Si ta carte en contient, publie depuis Studio après les avoir modifiés.

## Publier via GitHub Actions
1. Crée une clé API sur https://create.roblox.com/credentials avec la permission `universe-places` (écriture) limitée à ton jeu.
2. Dans le repo GitHub : secret `ROBLOX_API_KEY`, variables `UNIVERSE_ID` et `PLACE_ID`. Crée un environnement `production` avec relecteur obligatoire.
3. Onglet Actions → Publish → *Run workflow*. Choisis **Saved** pour vérifier dans Studio, puis **Published** pour mettre en ligne.

Ne mets jamais la clé dans un fichier du repo.
