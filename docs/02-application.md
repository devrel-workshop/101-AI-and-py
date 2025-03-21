## Instructions to create the application for AI Deploy

Here you find all steps to create and run an image to create an application based on the previous trained the model (with AI Training).

### Script creation

ℹ️ You can access to the solutions in the folder [src/app/solution](../src/app/solution) ℹ️

Follow the instructions in the [/src/app/app.py](../src/app/app.py) file to add code to create an application using the model.

If you need to debug your Python application you can run locally your app.
To run your application locally:
- install dependencies: `pip install -r requirements.txt`
- download / get the weights of your trained model and copy it to a `work` folder
- set the environment variables:
 - `export WORK_PATH=./work/`
- run the application: `streamlit run app.py`

### Image build

The Python script need to access to the following path mounted as volume in your image: `/workspace/attendee`.

The registry used to store the image is the an Harbor registry provided by OVHcloud for tests.
You can find it on the OVHcloud AI Dashboard in the registries section.
Once you have get the values, you must set the following environment variables:
 - `export REGISTRY_NAME=<your test registry name>`
 - `export REGISTRY_LOGIN=<test registry login>`
 - `export REGISTRY_PASSWORD=<test registry password>`

In `/src/app/`, build the image using Docker: `docker build . -t $REGISTRY_NAME/$STUDENT_ID/yolov11-rock-paper-scissors-app:1.0.0`.  
Then, authenticate to the registry: `docker login $REGISTRY_NAME  -u $REGISTRY_LOGIN -p $REGISTRY_PASSWORD`.
⚠️ Perhaps you have to remove some previous created Docker images to free space to build this image ⚠️
Then, push the builded image: `docker push $REGISTRY_NAME/$STUDENT_ID/yolov11-rock-paper-scissors-app:1.0.0`.

### App creation

 - run the app with AI App:
```bash
ovhai app run \
    --name yolov11-rock-paper-scissors-app \
    --cpu 1 \
    --default-http-port 8501 \
    --volume ai-tech-lab@UK/:/workspace/attendee:RW:cache \
    --unsecure-http \
    $REGISTRY_NAME/$STUDENT_ID/yolov11-rock-paper-scissors-app:1.0.0
```
If you don't have a private registry feel free to use pre-build image on Docker Hub:
```bash
ovhai app run \
    --token $AI_TOKEN \
    --name yolov11-rock-paper-scissors-app \
    --cpu 1 \
    --default-http-port 8501 \
    --volume ai-tech-lab@UK/:/workspace/attendee:RW:cache \
    --unsecure-http \
    ubf2r2if.c1.gra9.container-registry.ovh.net/lab/teacher/yolov11-rock-paper-scissors-app:1.0.0
```
- get the logs: `ovhai app logs -f <app id>`
- get the URL:
	- get the application id: `ovhai app list` 
	- find the field `Url` in the details of the application with the command: `ovhai app get <app id>`
	