# Get the attendee configuration parameters
if ! [ -f "./attendee-conf.json" ];then
  curl -u attendee http://162.19.64.158/lab-information -o attendee-conf.json
  #curl -u attendee http://localhost:8080/lab-information -o attendee-conf.json
fi

echo "Downladed parameters:"
cat attendee-conf.json|jq

STUDENT_ID=$(jq -r '.teamName' "attendee-conf.json")
REGISTRY_NAME=ubf2r2if.c1.gra9.container-registry.ovh.net/lab
REGISTRY_LOGIN=$(jq -r '.registryLogin' "attendee-conf.json")
REGISTRY_PASSWORD=$(jq -r '.registryPassword' "attendee-conf.json")
AI_TOKEN=$(jq -r '.token' "attendee-conf.json")

echo "Your environment variables:"
echo "   - STUDENT_ID: " $STUDENT_ID
echo "   - REGISTRY_NAME: " $REGISTRY_NAME
echo "   - REGISTRY_LOGIN: " $REGISTRY_LOGIN
echo "   - REGISTRY_PASSWORD: " $REGISTRY_PASSWORD
echo "   - AI_TOKEN: " $AI_TOKEN

echo "Your notebook URL: " $(jq -r '.notebookUrl' "attendee-conf.json")

# Configure ovhai CLI
curl https://cli.gra.ai.cloud.ovh.net/install.sh | bash

# List the notebook for attendee
ovhai notebook list --token $AI_TOKEN

# create and activate a python venv
python3 -m venv .venv
source .venv/bin/activate