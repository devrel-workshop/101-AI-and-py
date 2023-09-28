
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
    - name: `rock-paper-scissors-data`

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