## Instructions to create the job for AI Training

### Image creation
In `/src/training/`, create the image using Docker: `docker build . -t wilda/yolov8-rock-paper-scissors-training-job:1.0.0`

### Object storage creation

Use the previous created object storage `101-ai-lab-model` & `101-ai-lab-data`

### Job creation 

Use the CLI to create the Job:
```bash
ovhai job run \
	--name yolov8-rock-paper-scissors-training-job \
	--gpu 1 \
	--ssh-public-keys "ssh-rsa my cool public key" \
	--volume 101-ai-lab-data@GRA/:/workspace/data:RWD:cache \
	--volume 101-ai-lab-model@GRA/:/workspace/model:RWD:cache \
	--unsecure-http \
	wilda/yolov8-rock-paper-scissors-training-job:1.0.0
```
