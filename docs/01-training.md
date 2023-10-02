## Instructions to create the job for AI Training

Here you find all steps to create and run an image to train the model previously design with AI Notebook.

### Image build

The Python script need to access to two paths:
 - one to load the training data: `/workspace/attendee/data.yaml`
 - one to write the trained model: `/workspace/attendee/`

These two locations are mounted as volume of the image, the paths for the host are the OVHcloud object containers storage used in the Notebook: `attendee-$STUDENT_ID-data`.

The registry used to store the image is the an Harbor registry provided by OVHcloud, ask the speakers for the URL and account.

In `/src/training/`, build the image using Docker: `docker build . -t $REGISTRY_NAME/$STUDENT_ID/yolov8-rock-paper-scissors-training-job:1.0.0`.  
Then, authenticate to the registry: `docker login $REGISTRY_NAME  -u $REGISTRY_LOGIN -p $REGISTRY_PASSWORD`.
Then, push the builded image: `docker push $REGISTRY_NAME/$STUDENT_ID/yolov8-rock-paper-scissors-training-job:1.0.0`.

### Run locally 

If you need to debug your Python application you can run locally your training (beware of the performances you don't have GPU locally).
To run your training locally:
	- install dependencies: `pip install -r requirements.txt`
	- set the environment variables:
		- `export NB_OF_EPOCHS=1`
		- `export DEVICE_TO_USE=cpu`
		- `export PATH_TO_DATASET=/workspace/101-AI-and-py/src/training/local-dataset/data.yaml`
		- `export PATH_TO_EXPORTED_MODEL=./`
	- run the training: `python train.py`

### Job creation 

Use the CLI to create the Job:
```bash
ovhai job run \
	--name attendee-$STUDENT_ID-yolov8-rock-paper-scissors-training-job \
	--gpu 1 \
	--env NB_OF_EPOCHS=10 \
	--volume attendee-$STUDENT_ID-data@GRA:/workspace/attendee:RW:cache \
	--unsecure-http \
	$REGISTRY_NAME/$STUDENT_ID/yolov8-rock-paper-scissors-training-job:1.0.0
```

Follow the training with the logs: `ovhai job logs -f <job id>`