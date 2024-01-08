# Get the attendee configuration parameters
curl -u attendee http://162.19.64.158/lab-information -o attendee-conf.json
echo "Downladed parameters:"
cat attendee-conf.json|jq

STUDENT_ID=$(jq -r '.studentId' "attendee-conf.json")
REGISTRY_NAME=ubf2r2if.c1.gra9.container-registry.ovh.net/lab
REGISTRY_LOGIN=$(jq -r '.registryLogin' "attendee-conf.json")
REGISTRY_PASSWORD=$(jq -r '.registryPassword' "attendee-conf.json")
AI_TOKEN=$(jq -r '.token' "attendee-conf.json")
WORKSHOP_NAME=$(jq -r '.workshopName' "attendee-conf.json")
#AI_USER=$(jq -r '.username' "attendee-conf.json")
#AI_PASSWORD=$(jq -r '.password' "attendee-conf.json")

echo "Your environment variables:"
echo "   - STUDENT_ID: " $STUDENT_ID
echo "   - REGISTRY_LOGIN: " $REGISTRY_LOGIN
echo "   - REGISTRY_PASSWORD: " $REGISTRY_PASSWORD
echo "   - AI_TOKEN: " $AI_TOKEN
echo "   - WORKSHOP_NAME: " $WORKSHOP_NAME 
#echo "   - AI_USER: " $AI_USER
#echo "   - AI_PASSWORD: " $AI_PASSWORD

# Authentication with AI CLI
#ovhai login -u $AI_USER -p $AI_PASSWORD
#echo "You are connected with your AI user:"
#ovhai me

# List the notebook for attendee
echo ovhai notebook list --token $AI_TOKEN
ovhai notebook list --token $AI_TOKEN