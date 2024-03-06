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

# Get code source from official demos
git clone -n --depth=1 --filter=tree:0 https://github.com/ovh/public-cloud-examples test-git
git sparse-checkout set --no-cone ai/notebooks/YOLOV8 ai/training/YOLOV8 ai/deploy/YOLOV8
git checkout

# List the notebook for attendee
echo ovhai notebook list --token $AI_TOKEN
ovhai notebook list --token $AI_TOKEN