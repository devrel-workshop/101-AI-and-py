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
  - Gitpod
    - Ce que c'est
    - Pourquoi ?
    - Comment ?

### Environnement
 - 🐼 IDE (cloud)
   - Choix CDE
     - Coder
       - V2
       - Image de démarrage
       - Stocker l'image sur Harbor OVHcloud ?
     - GitPod
       - V1
       - .gitpod.yaml / image
       - Stocker l'image sur Harbor
   - OVHAI CLI
   - Python + libs
   - outils (à lister)
 - OVHcloud
   - TF / Quarkus / Python
   - AI
   - data
     - préparer les données en amont sur un object storage pour gagner du temps
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

##### 🧸 YOLO V7 / V8
 - pré-entrainé 
 - à améliorer 
   - transfer learning
   - relabeliser après inférence 

##### Flowers power
 - resnet 50
   - classification d'images
   - transfert learning
   - 🎥 https://youtu.be/v7wmNcSKDko
   - https://github.com/ovh/ai-training-examples/blob/main/notebooks/computer-vision/image-classification/tensorflow/resnet50/notebook-resnet-transfer-learning-image-classification.ipynb

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
    - notions
      - "on vous propose d'ouvrir le capot sans démonter le moteur"
  - Optionnel
    - Embarqué
### 🎙 CFPs
  - Cloud Nord
    - ✅ 📝 
  - Devoxx Marocco
    - ✅ Compte à créer pour Thierry  
    - ✅ 📝 
  - Devoxx Belgium
    - ✅ Compte à créer pour Stéphane
    - ✅ 📝 