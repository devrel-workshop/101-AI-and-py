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

# 🛠 Get configuration from environment variables
nbOfEpochs = os.getenv('NB_OF_EPOCHS', 10)
deviceToUse = os.getenv('DEVICE_TO_USE', 0)
pathToDataset = os.getenv('PATH_TO_DATASET', '/workspace/attendee/data.yaml')
pathToExportedModel = os.getenv('PATH_TO_EXPORTED_MODEL', '/workspace/attendee/')
print('Number of epochs to set:', nbOfEpochs)
print('Device to set:', deviceToUse)
print('Path to the dataset to set:', pathToDataset)
print('Path to the exported model to set:', pathToExportedModel)

# 💪 Train the model with new data ➡️ one GPU / 10 itérations (epochs)
model.train(data=pathToDataset, device=deviceToUse, epochs=int(nbOfEpochs), batch=1, verbose=True)

# 💾 Save the model
exportedMetaData = model.export()
print('Model save to : ' + exportedMetaData)

# ➡️ Copy the model to the object storage
shutil.copy(exportedMetaData, pathToExportedModel)