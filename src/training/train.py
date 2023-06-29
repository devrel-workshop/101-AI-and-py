import ultralytics
from ultralytics import YOLO
import shutil

###################################################################################################################
## 🎯 The aim of this script is to do transfert learning on YOLOv8 model.                                        ##
## 💿 The data for train the model are in /workspace/data/<env.DATA_FOLDER_NAME> where env.DATA_FOLDER_NAME      ##
## 🧠 The train model are stored in /workspace/model/<env.DATA_FOLDER_NAME>                                      ##
## ℹ️ Note: <env.DATA_FOLDER_NAME> is an environment variable passed to the Docker run command to specify the    ##
## location of the training data.                                                                                ##
###################################################################################################################

# ✅ Check configuration
ultralytics.checks()
# 🧠 Load a pretrained YOLO model
model = YOLO('yolov8n.pt')
# 💪 Train the model with new data ➡️ one GPU / 5 itérations (epochs)
model.train(data='/workspace/data/rock-paper-scissors/data.yaml', device=0, epochs=5)
# 💾 Save the model
exportedMetaData = model.export()
print('Model save to : ' + exportedMetaData)
# ➡️ Copy the model to the object storage
shutil.copy(exportedMetaData, '/workspace/model/rock-paper-scissors/')
#shutil.copy(exportedMetaData, '/tmp/')