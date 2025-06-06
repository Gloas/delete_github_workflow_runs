#!/bin/bash

# Couleurs pour plus de fun
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Vérification des dépendances
command -v gh >/dev/null 2>&1 || { 
    echo -e "${RED}ERREUR: Le CLI GitHub (gh) n'est pas installé.${NC}" >&2
    echo "Installez-le via: brew install gh ou apt-get install gh"
    exit 1
}

command -v jq >/dev/null 2>&1 || {
    echo -e "${RED}ERREUR: jq n'est pas installé.${NC}" >&2
    echo "Installez-le via: brew install jq ou apt-get install jq"
    exit 1
}

# Vérification des arguments
if [[ $# -ne 2 ]]; then
    echo -e "${YELLOW}Utilisation: $0 <nom_utilisateur> <nom_depot>${NC}"
    echo -e "Exemple: $0 Gloas delete_github_workflow_runs"
    exit 1
fi

chefDeProjet="$1"  # Le grand maître du dépôt
nomDuBebeCode="$2"  # Le précieux projet à nettoyer

echo -e "${YELLOW}🔍 Inspection des exécutions de workflow pour ${chefDeProjet}/${nomDuBebeCode}...${NC}"

listeDesBavures=$(gh api "/repos/$chefDeProjet/$nomDuBebeCode/actions/runs" --paginate | jq -r '.workflow_runs[] | [.id] | @tsv')

if [[ -z "$listeDesBavures" ]]; then
    echo -e "${GREEN}✅ Rien à nettoyer - le dépôt est déjà propre comme un sou neuf !${NC}"
    exit 0
fi

echo -e "${YELLOW}🚨 Attention: ${RED}$(echo "$listeDesBavures" | wc -l)${NC} workflows suspects repérés !"

for coupable in $listeDesBavures; do
    echo -e "${RED}🗑️  Exécution sommaire du workflow ID $coupable ⚖️${NC}"
    gh api -X DELETE "/repos/$chefDeProjet/$nomDuBebeCode/actions/runs/$coupable" --silent && \
        echo -e "${GREEN}✅ ID $coupable: Éliminé avec succès!${NC}" || \
        echo -e "${RED}❌ ID $coupable: Résiste étrangement à la suppression!${NC}"
done

echo -e "${GREEN}🎉 Nettoyage terminé ! Le dépôt respire à nouveau.${NC}"
