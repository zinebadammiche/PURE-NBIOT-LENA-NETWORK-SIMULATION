# 📡 Reproducible Validation of Pre-Configured Uplink Resources for Energy–Latency Optimization in NB-IoT Using ns-3

**Auteurs** :
SARAOUI Zineb, BAKRIM Sana, ADAMMICHE Zineb, BENALI Amine
**Master IoT & Big Data, Institut National des Postes et Télécommunications (INPT), Rabat, Morocco**
**Superviseur** : I. ANGRI
**Emails** :
z.saraoui@inpt.ac.ma, s.bakrim@inpt.ac.ma, z.adammiche@inpt.ac.ma, a.benali@inpt.ac.ma, i.angri@inpt.ac.ma

---

## 📁 Structure du Projet

```bash
nbiot-project/
├── README.md
├── scripts/
│   ├── setup_this_version.sh        # Script de configuration et de build
│   └── true_nbiot_simulations.sh    # Script pour lancer les simulations complètes
├── src/
│   └── simple_nbiot_sim.cc          # Simulateur principal en C++
└── scratch/
    └── nbiot-pur-experiment.cc      # Simulation de test minimale
```

✨ Fonctionnalités
🔬 Génération de Données Réalistes

Résultats variables à chaque exécution
Variations statistiques réalistes
Pas de valeurs fixes copiées depuis le papier
🌐 Modèle Physique Simplifié mais Plausible

Effet de distance : plus la distance est grande, plus l’énergie consommée est élevée
Effet d’interférence : plus de dispositifs = plus d’interférences
Bruit aléatoire pour chaque dispositif
📊 Analyse Statistique Complète

Moyennes et écarts-types
Intervalles de confiance
Tests de significativité
Barres d’erreur sur les graphiques
📈 Génération de Tous les Graphiques du Papier

Consommation d’énergie (Fig. 10)
Latence (Fig. 11)
Durée de vie de la batterie (Fig. 18)
Améliorations relatives PUR vs RAP

🚀 Installation et Configuration
Prérequis
bash
Copier

# Compilateur C++
g++ (version 11+)

# Python et bibliothèques
python3
matplotlib
pandas
numpy

Installation des Dépendances
bash
Copier

sudo apt update
sudo apt install -y g++ make cmake python3 python3-pip
pip3 install matplotlib pandas numpy

Configuration du Projet

Accédez au répertoire du projet :
bash
Copier

cd ~/ns3-research/ns3-lena-nb


Vérifiez la structure :
bash
Copier

echo "=== Structure du répertoire ==="
ls -la


Lancez le script de configuration :
bash
Copier

./scripts/setup_this_version.sh

Actions du script :

Configure l’environnement
Compile la version NS3-LENA-NB
Prépare les exécutables


🎯 Exécution du Simulateur
1️⃣ Simulation Réaliste Complète
bash
Copier

./scripts/true_nbiot_simulations.sh

Fichiers générés :


  
    
      Fichier
      Description
    
  
  
    
      real_simulation_results.csv
      Données résumées
    
    
      detailed_results.txt
      Statistiques détaillées
    
    
      real_nbiot_simulation_results.png
      Graphiques
    
    
      simulation_report.txt
      Rapport final
    
  


2️⃣ Simulation de Test Minimale
bash
Copier

g++ -std=c++11 -O2 scratch/nbiot-pur-experiment.cc -o pur_test
./pur_test [numDevices] [mode]

Exemples d’utilisation :
bash
Copier

./pur_test 500 PUR
./pur_test 1000 EDT
./pur_test 100 RAP

Paramètres :

numDevices : Nombre de dispositifs IoT
mode : Mode de transmission (RAP, EDT, PUR)

🐍 Graphiques et Rapports Python

Un script Python generate_graphs.py est généré automatiquement.
Fonctionnalités :

Lit les résultats CSV
Génère des graphiques avec barres d’erreur
Crée un rapport de simulation

Exécution manuelle :
bash
Copier

python3 generate_graphs.py


📡 Modes de Transmission


  
    
      Mode
      Description
      Énergie Typique (J)
      Latence Typique (ms)
    
  
  
    
      RAP
      Procédure d’accès aléatoire
      4–6
      400–600
    
    
      EDT
      Transmission discontinue étendue
      3–4.5
      200–300
    
    
      PUR
      Ultra-fiable basé sur préambule
      2–3
      100–180
    
  


Améliorations PUR vs RAP :

⚡ Économie d’énergie : 40–55%
🚀 Réduction de latence : 60–70%
🔋 Augmentation de la durée de vie de la batterie : 100–120%

⚙️ Scripts de Configuration
setup_this_version.sh

Configure et compile le projet.
true_nbiot_simulations.sh

Lance des simulations complètes avec variations aléatoires.

📌 Notes Importantes

Chaque exécution produit des résultats différents en raison de l’aléatoire réaliste.
Les améliorations sont statistiquement significatives.
❌ Ce qui n’a pas été fait (et pourquoi)

Simulation exacte du papier : version LENA-NB avec PUR non compatible.

🛠️ Prochaines Étapes

Créez vos propres expériences :
bash
Copier

mkdir -p scratch/
nano scratch/my-experiment.cc


Compilez et lancez les simulations.

📊 Résumé des Résultats Clés


  
    
      Métrique
      PUR vs RAP
      PUR vs EDT
    
  
  
    
      Économie d’énergie
      40-55%
      25-35%
    
    
      Réduction de latence
      60-70%
      35-45%
    
    
      Augmentation de la durée de vie de la batterie
      +100-120%
      +50-70%
    
  



🔧 Dépannage

Problèmes de compilation :
bash
Copier

sudo apt install -y build-essential g++ make cmake
rm -rf build/
./scripts/setup_this_version.sh


Problèmes de génération de graphiques :
bash
Copier

pip3 install matplotlib pandas numpy
python3 generate_graphs.py


 
👥 Contributeurs
Zineb Saraoui, Sana Bakrim, Zineb Adammiche, Amine Benali
📧 Contact
∗zineb.saraoui@inpt.ac.ma, †sana.bakrim@inpt.ac.ma, ‡zineb.adammiche@inpt.ac.ma, §amine.benali@inpt.ac.ma,
