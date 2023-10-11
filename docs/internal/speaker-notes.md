
# Speaker informations to do te workshop

## Cloud resources creation
  - public cloud project : WORKSHOP_101_AI
  - create token to create resources: [OVH token generation page](https://www.ovh.com/auth/api/createToken?GET=/*&POST=/*&PUT=/*&DELETE=/*)
  - configure Terraform: [Using Terraform with OVHcloud](https://help.ovhcloud.com/csm/fr-terraform-at-ovhcloud?id=kb_article_view&sysparm_article=KB0054776)

### Create the users
  - set the environment variables `OVH_APPLICATION_KEY`, `OVH_APPLICATION_SECRET`, `OVH_CONSUMER_KEY` and `OVH_CLOUD_PROJECT_SERVICE`
  - set the environment variables `OS_AUTH_URL`, `OS_USERNAME`, `OS_PASSWORD` and `OS_TENANT_NAME`
  - apply the terraform script [create-users.tf](../src/tf/create-users.tf): `terraform apply -var="number_of_users=<number of users>"`
  - get users credentials: `terraform output ai-users`

### Create the Objects Storage
  - apply the terraform script [create-swift-objects.tf](../src/tf/ai-swift/create-swift-objects.tf): `terraform apply -var="number_of_attendees=<number of attendees>"`
  - get attendees swift container object name: `terraform output ai-objects-storage`
  - create the shared object storage (Swift): 
    - type: private
    - name: `attendee-backup-data`

## AI products configuration
### Harbor registry

  - in the Dashboard section:
    - `Docker Registries`
    - `Add`
    - Region: `GRA`
    - Username: `<user to pull / push>`
    - password: `<user password>`
    - Private Docker Registry URL : `<Harbor URL>`

## Timing

### Slides

### AI Notebook demo

  - dataset download: ~1"
  - pips: ~2"30
  - training: ~5"

### AI Training demo

  - Docker image build: ~4"
  - Docker push image: ~20"/~12"
  - AI training job: ~60" for 50 epochs / ~20" for 10 epochs

### AI Deploy demo
  - AI Deploy launch: ~8"
  - to get the full tained model: `ovhai bucket object copy attendee-backup-data@GRA --container attendee-$STUDENT_ID-data best.torchscript best.torchscript`

## Déroulé
### Notebook
  - tout se passe dans /workspace/attendee
  - cellule 1 : extrait le dataset depuis l'object storage `workshop-resources`
  - cellules 2 & 3 : dépendances pip avec notamment ultralytics qui est l'implem de YoloV8
  - cellule 4 : check de la conf ultralytics et GPU
  - cellule 5 : récupération du modèle : on prends le plus petit pour que cela tienne dans le lab
  - cellule 6 : premier test avec une image : une personne est reconnue mais pas les ciseaux
  - cellule 7 : entraînement sur 5 epochs (5 boucles) sur le dataset pierre/feuille/ciseaux (device 0 c'est pour sélectionner le GPU)
  - cellule 8 : résultat des entraînement : il faut que la courbe bleue ne ls'éloigne pas trop de la courbe en pointillés et que elle se rapproche d'un plat, là on voir que l'on peut améliorer encore, c'est normal 5 epochs ce n'est pas suffisant
  - cellule 9 : on sauvegarde le modèle pour utilisation future et on utilise un donnée de test, le premier run rien n'est détecté, il faut descendre le seuil de confiance à 0,4 pour arriver à voir un truc, cela montre que le modèle n'est pas optimum encore
  - cellule 10 : on reteste aec l'image du début, cela fonctionne : cela montre que la prédiction dépend aussi de la qualité de l'image
  - cellule 11 : on copie le modèle sur l'object storage pour utilisation dans le training et l'app

### Training
  - l'entrainement prends 20 minutes et le push est toujours aussi long, pas sûr que ça vaille le coup d'aller au bout, tu pourra utiliser le modèle / image de backup
  - suivre le markdown pour tout ce qui est construction
  - je pense que le dockerfile c'est bon et le code python est une récupération de que l'on a fait sur le notebook
  - soit tu fais une pause au moment du push de l'image
  - soit pour lancer l'entraînement tu utilises l'image de backup : (slide 66):
```bash
ovhai job run \
 --name attendee-$STUDENT_ID-yolov8-rock-paper-scissors-training-job \
 --gpu 1 \
 --env NB_OF_EPOCHS=10 \
 --volume attendee-$STUDENT_ID-data@GRA:/workspace/attendee:RW:cache \
 --unsecure-http \
 $REGISTRY_NAME/backup/yolov8-rock-paper-scissors-training-job:1.0.0
 ```
  - mais comme je te l'ai dit l'entraînement n'aura pas fini  --> j'ai mis 10 epochs dans ce doc, à l'origine c'est 50, le 10 c'est si tu fais une pause en même temps sinon laisse le 50

### App
  - comme pour le training prendre le backup au moment du run car le push de l'image est trop long
  - suivre le markdown pour tout ce qui est construction
  - je pense que le dockerfile c'est bon et le code python est une récupération de que l'on a fait sur le notebook
  - backup:
    - copier le modèle pré-entrainer : `copy attendee-backup-data@GRA --container attendee-$STUDENT_ID-data best.torchscript best.torchscript`
    - lancer l'app:
```bash
ovhai app run \
 --name attendee-$STUDENT_ID-yolov8-rock-paper-scissors-app \
 --cpu 1 \
 --default-http-port 8501 \
 --volume attendee-$STUDENT_ID-data@GRA:/workspace/attendee:RW:cache \
 --unsecure-http \
 $REGISTRY_NAME/backup/yolov8-rock-paper-scissors-app:1.0.0
```
  - ça prend un peu de temps : pendant ce temps : questions / pause