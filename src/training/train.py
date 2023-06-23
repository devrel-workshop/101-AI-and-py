from ultralytics import YOLO

###################################################################################################################
## 🎯 The aim of this script is to do transfert learning on YOLOv8 model.                                        ##
## 💿 The data for train the model are in /workspace/data/<env.DATA_FOLDER_NAME> where env.DATA_FOLDER_NAME      ##
## 🧠 The train model are stored in /workspace/model/<env.DATA_FOLDER_NAME>                                      ##
## ℹ️ Note: <env.DATA_FOLDER_NAME> is an environment variable passed to the Docker run command to specify the    ##
## location of the training data.                                                                                ##
###################################################################################################################

# 🧠 Load a pretrained YOLO model
model = YOLO('/workspace/model/yolov8n.pt')
# 💪 Train the model with new data
model.train(data='/workspace/data/rock-paper-scissors/data.yaml', device=0, epochs=5)
# 💾 Save the model
model.save('/workspace/model/rock-paper-scissors/rock-paper-scissors')