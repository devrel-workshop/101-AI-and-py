import ultralytics
from ultralytics import YOLO
import shutil
import os

#######################################################################################################################
## 🎯 The aim of this script is to do transfert learning on YOLOv8 model.                                            ##
## 💿 The data for train the model are in /workspace/attendee/                                                       ##
## 🧠 The train model are stored in /workspace/attendee/                                                             ##
## ℹ️ Note: NB_OF_EPOCHS is an environment variable passed to the Docker run command to specify the number of epochs ##
#######################################################################################################################

# ✅ Check configuration
ultralytics.checks()
# 🧠 Load a pretrained YOLO model
model = YOLO('yolov8n.pt')
# 💪 Train the model with new data ➡️ one GPU / 5 itérations (epochs)
nbOfEpochs = os.getenv('NB_OF_EPOCHS', 10)
print('Number of epochs to set:', nbOfEpochs)
model.train(data='/workspace/attendee/data.yaml', device=0, epochs=int(nbOfEpochs), verbose=True)
# 💾 Save the model
exportedMetaData = model.export()
print('Model save to : ' + exportedMetaData)
# ➡️ Copy the model to the object storage
shutil.copy(exportedMetaData, '/workspace/attendee/')