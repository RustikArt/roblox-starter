# Journal des décisions

## ADR-0001 — Rojo + Git comme source de vérité
Le code et le contenu du jeu vivent dans des fichiers versionnés ; Studio est un client. Permet aux agents de travailler sur les fichiers, d'exécuter des vérifications automatiques et de construire le place en CI.

## ADR-0002 — Carte versionnée dans `world/`
La publication API remplace tout le place ; la carte doit être dans le repo pour que la CI ne l'écrase pas.

## ADR-0003 — Tests Lune pour la logique pure
La logique sans API Roblox est testée en ligne de commande, rapidement, par les agents.

## Modèle pour les suivantes
`ADR-000X — Titre` · Contexte · Décision · Conséquences · Alternatives écartées.
