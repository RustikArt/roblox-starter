# Architecture

## Couches
- `shared` : config et logique pure (testable avec Lune), aucune dépendance serveur/client.
- `server` : services démarrés par `Main.server.luau` dans un ordre explicite. Autorité sur les données et l'économie.
- `client` : UI, input, rendu. Demande, n'impose jamais.

## Conventions
- Un module = une responsabilité. `--!strict` partout.
- Services serveur : table avec une fonction `start()`.
- Réseau : tout RemoteEvent/RemoteFunction est déclaré à un endroit unique, ses arguments sont validés par `RemoteGuard` côté serveur.
- Données joueur : persistance via une bibliothèque éprouvée (à choisir, voir DECISIONS.md), jamais de DataStore brut dispersé.

## Évolution
Ajoute ici chaque système important (diagramme ou liste) quand il est créé.
