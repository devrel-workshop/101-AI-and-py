
# Speaker informations to do te workshop

## Cloud resources creation
  - public cloud project : WORKSHOP_101_AI
  - create token to create resources: [OVH token generation page](https://www.ovh.com/auth/api/createToken?GET=/*&POST=/*&PUT=/*&DELETE=/*)
  - configure Terraform: [Using Terraform with OVHcloud](https://help.ovhcloud.com/csm/fr-terraform-at-ovhcloud?id=kb_article_view&sysparm_article=KB0054776)


### Create the users
  - set the environment variables `OVH_APPLICATION_KEY`, `OVH_APPLICATION_SECRET`, `OVH_CONSUMER_KEY` and `OVH_CLOUD_PROJECT_SERVICE`
  - apply the terraform script [create-users.tf](../src/tf/create-users.tf): `terraform apply -var="number_of_users=<number of users>"`
  - get users credentials: `terraform output ai-users`
  - add the missing role `AI Training Reader`
## AI Token creation
  - authenticate with your Openstack user (must have the roles: `AI Training Operator` & `AI Training Reader`)
  - create tokens with the command: `ovhai token create -r operator <token name>`
  - store / share the created token with students