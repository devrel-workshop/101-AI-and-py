---
markmap:
  colorFreezeLevel: 3
---

<!-- To view the graphical version use Makmap plugin: https://marketplace.visualstudio.com/items?itemName=gera2ld.markmap-vscode or the web site/ CLI : https://markmap.js.org -->

## 101

### Théorie
#### 🧸 IA
 - bases
 - conception / entraînement / inférence
 - CPU vs GPU
 
#### 🐼 Python
 - pip
 - bases (script vs classes)

#### 🐼 CDE

### Environnement
 - 🐼 IDE (cloud)
   - Choix CDE
     - Coder
       - Image de démarrage
       - Stocker l'image sur Harbor OVHcloud ?
   - OVHAI CLI
   - Python + libs
   - outils (à lister)
 - OVHcloud
   - TF / Quarkus / Python
   - AI
   - data
 - Repo GH
   - ✅ organisation
   - ✅ repos

### Sujet
#### Détection d'image
##### Préparation des données
 - Python
 - S'inspirer tutos OVHcloud
 - ForePaaS ?
 - OVHcloud ETL ?

##### 🧸 YOLO V?
 - pré-entrainé 
 - à améliorer 
   - transfer learning
   - relabeliser après inférence 

##### 🧸 Modèle détection des points ?
  - cf Axa (Devoxx)

### Modèle
 
#### Conception
 - Notebook
 - VSCode

### Application
 - Cloud (AI Deploy)
 - Python
 - Back Python
   - Front (streamlit)
   - Inférence

### Embarqué

#### Matériel
 - budget initial conséquent
 - carte à la Pi4
 - Module vidéo

#### Détection d'image
 - mini Yolo custo avec étapes cloud

### Todo
 - se renseigner sur YOLO 
   - Talk Eléa
   - Eléa
   - Transfer learning
   - Custo entrainement en python

### Abstract
  - Indiquer le CDE
  - Indiquer Python
  - Indiquer IA
  - Pré-requis
    - CDE (opérationnelle)
    - IA (POC)
      - Modèle
      - App 
      - Notebook
      - Dataset
    - Python (POC)
      - App
      - Choix Fwks (streamlit, ...)
    - Environnements OVHcloud
      - création / destruction
      - "env" étanches par participant.e.s
      - token IA par participant.e.s
      - CLI pour créer Notebook / Training / Deploy
  - Optionnel
    - Embarqué