# Workflow Executioner 💀

Le bourreau officiel des workflows GitHub - parce que parfois il faut savoir trancher !

## Fonctionnalités ✨
- 🔪 Exécution sommaire des workflows
- 🎨 Interface colorée avec des emojis dramatiques
- 🕵️‍♂️ Inspection approfondie des coupables
- 📜 Messages judiciaires clairs
- 🔄 Prise en charge de la pagination GitHub

## Prérequis ⚖️
- [GitHub CLI (gh)](https://cli.github.com/) installé et configuré
- [jq](https://stedolan.github.io/jq/) pour analyser les preuves JSON
- Un token GitHub avec les permissions `actions:write` (mandat d'arrêt)

## Installation 🛠️
```bash
git clone https://github.com/Gloas/delete_github_workflow_runs.git
cd delete_github_workflow_runs
chmod +x workflow_executioner.sh
```

## Utilisation ⚡
```bash
./workflow_executioner.sh <bourreau> <condamné>
```

Paramètres:
- `<bourreau>`: Votre nom d'utilisateur GitHub
- `<condamné>`: Le nom du dépôt à purger

## Exemples 🎭
```bash
# Purger son propre dépôt
./workflow_executioner.sh me mon-super-projet

# Nettoyer un dépôt d'organisation
./workflow_executioner.sh organisation mon-projet
```

## Avertissement ⚠️
Ce script est irréversible - comme une guillotine !

## Licence 📜
MIT - Licence Officielle du Bourreau
