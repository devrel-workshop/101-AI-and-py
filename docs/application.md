## Instructions to create the job for AI Training

### Object storage creation

Use the previous created object storage to get the model: `101-ai-lab-model`.
Use the previous created object storage to upload the photos: `101-ai-lab-data`.

### App creation
 - make the Docker image: `docker build -t wilda/yolov8-rock-paper-scissors-app:1.0.0 .`
 - run the app with AI App:
```bash
ovhai app run \
	--name yolov8-rock-paper-scissors-app \
	--cpu 1 \
	--default-http-port 8501 \
	--volume 101-ai-lab-data@GRA:/workspace/data:RWD:cache \
	--volume 101-ai-lab-model@GRA:/workspace/model:RO:cache \
	--unsecure-http \
	wilda/yolov8-rock-paper-scissors-app:1.0.0
```
