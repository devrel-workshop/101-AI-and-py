## Instructions to create the job for AI Training

Here you find all steps to create and run an image to train the model previously design with AI Notebook.

### Image build

The Python script need to access to two paths:
 - one to load the training data: `/workspace/data/rock-paper-scissors/data.yaml`
 - one to write the trained model: `/workspace/model/rock-paper-scissors/`

These two locations are mounted as volumes of the image, the paths for the host are the OVHcloud object containers storage used in the Notebook: `101-ai-lab-model` & `101-ai-lab-data`.

The registry used to store the image is the an Harbor registry provided by OVHcloud, ask the speakers for the URL and account.

In `/src/training/`, build the image using Docker: `docker build . -t $REGISTRY_NAME/$STUDENT_ID/yolov8-rock-paper-scissors-training-job:1.0.0`.  
Then, autheticate to the registry: `docker login $REGISTRY_NAME  -u $REGISTRY_LOGIN -p $REGISTRY_PASSWORD`.
Then, push the builded image: `docker push $REGISTRY_NAME/$STUDENT_ID/yolov8-rock-paper-scissors-training-job:1.0.0`.

### Job creation 

Use the CLI to create the Job:
```bash
ovhai job run \
	--token $OVH_AI_TOKEN \
	--name yolov8-rock-paper-scissors-training-$STUDENT_ID-job \
	--gpu 1 \
	--volume 101-ai-lab-data@GRA/:/workspace/data:RWD:cache \
	--volume 101-ai-lab-model@GRA/:/workspace/model:RWD:cache \
	--unsecure-http \
	$REGISTRY_NAME/$STUDENT_ID/yolov8-rock-paper-scissors-training-job:1.0.0
```
