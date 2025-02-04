#!/bin/bash

echo "Connexion initiale pour obtenir un UUID..."

# Lancer websocat et attendre l'UUID
UUID=$(websocat ws://localhost:8080/rooms | head -n 1)

if [[ -z "$UUID" ]]; then
    echo "Erreur : Aucun UUID reçu."
    exit 1
fi

echo "UUID reçu : $UUID"
echo "Connexion à la salle $UUID..."

# Se connecter avec l'UUID reçu
websocat ws://localhost:8080/rooms/$UUID
