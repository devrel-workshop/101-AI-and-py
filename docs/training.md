## Instructions to create the job for AI Training

### Object storage creation

Use the previous created object storage `101-ai-lab-model` & `101-ai-lab-data`

### Job creation 

Use the CLI to create the Job:
```bash
ovhai job run \
	--name yolov8-cards-small-training-job \
	--flavor ai1-1-gpu \
	--gpu 1 \
	--ssh-public-keys "ssh-rsa my cool public key" \
	--volume 101-ai-lab-data@GRA/:/workspace/data:RWD:cache \
	--volume 101-ai-lab-model@GRA/:/workspace/model:RWD:cache \
	--unsecure-http \
	wilda/yolov8-cards-training-job:1.0.0
```
