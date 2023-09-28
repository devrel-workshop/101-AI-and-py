
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

### Notebook demo

  - init
  - pip n°1
  - pip n°2: ~10s
  - training: ~5mins