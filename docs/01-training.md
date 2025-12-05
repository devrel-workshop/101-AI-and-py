## Instructions to create the job for AI Training

Here you find all steps to create and run an image to train the model previously design with AI Notebook.

### Script creation

ℹ️ You can access to the solutions in the folder [src/training/solution](../src/training/solution) ℹ️

Follow the instructions in the [/src/training/train.py](../src/training/train.py) file to add code to train the model.

If you need to debug your Python application you can run locally your training (beware of the performances you don't have GPU locally).
To run your training locally:
 - install dependencies: `pip install -r requirements.txt`
 - set the environment variables:
```bash
export NB_OF_EPOCHS=1 \
export DEVICE_TO_USE=cpu \
export PATH_TO_DATASET=/workspace/101-AI-and-py/src/training/local-dataset/data.yaml \
export PATH_TO_EXPORTED_MODEL=./
```
 - run the training: `python train.py`

⚠️ The [src/training/local-dataset](../src/training/local-dataset) is only a subset of the real dataset for testing / debugging only ⚠️

### Image build

The Python script need to access to two paths:
 - one to load the training data: `/workspace/attendee/data.yaml`
 - one to write the trained model: `/workspace/attendee/`

These two locations are mounted as volume of the image, the paths for the host are the OVHcloud object container storage used in the Notebook: `xxxx_id`, for example `conference_0`.

The registry used to store the image is the an Harbor registry provided by OVHcloud for tests.
You can find it on the OVHcloud AI Dashboard in the registries section.
Once you have get the values, you must set the following environment variables:
 - `export REGISTRY_NAME=<your test registry name>`
 - `export REGISTRY_LOGIN=<test registry login>`
 - `export REGISTRY_PASSWORD=<test registry password>`

In `/src/training/`, build the image using Docker: `docker build . -t $REGISTRY_NAME/$STUDENT_ID/yolov11-rock-paper-scissors-training-job:1.0.0`.  
Then, authenticate to the registry: `docker login $REGISTRY_NAME  -u $REGISTRY_LOGIN -p $REGISTRY_PASSWORD`.
Then, push the builded image: `docker push $REGISTRY_NAME/$STUDENT_ID/yolov11-rock-paper-scissors-training-job:1.0.0`.

### Job creation 

Use the CLI to create the Job:
```bash
ovhai job run \
	--token $AI_TOKEN \
	--name yolov11-rock-paper-scissors-training-job \
	--gpu 1 \
	--env NB_OF_EPOCHS=10 \
	--volume polytech-tp-0@S3GRA/:/workspace/attendee:RW:cache \
	--unsecure-http \
	$REGISTRY_NAME/$STUDENT_ID/yolov11-rock-paper-scissors-training-job:1.0.0
```

If you don't have a private registry feel free to use pre-build image:
```bash
ovhai job run \
	--token $AI_TOKEN \
	--name yolov11-rock-paper-scissors-training-job \
	--gpu 1 \
	--env NB_OF_EPOCHS=10 \
	--volume  polytech-tp-0@S3GRA/:/workspace/attendee:RW:cache \
	--unsecure-http \
	ubf2r2if.c1.gra9.container-registry.ovh.net/lab/teacher/yolov11-rock-paper-scissors-training-job:1.0.0
```

Follow the training with the logs: `ovhai job logs --token $AI_TOKEN -f <job id>`