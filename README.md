## Welcome to the 101 lab source to discover Python and Artificial Intelligence.

### Getting started with Coder

Run the following command: `source ./setup_env.sh`
You will prompt to enter a password for user _attendee_: `Enter host password for user 'attendee':`.  

**Ask the speakers to get the password.**

After enter it you will see all your environment variable set and displayed:
```bash
Downladed parameters:
Your environment variables:
   - STUDENT_ID: <id of the attendee>
   - REGISTRY_NAME: the name of the registry to use with the Docker commands
   - REGISTRY_LOGIN: <login to the remote registry> 
   - REGISTRY_PASSWORD: <password to the remote registry>
```
Following by the information of your Notebook:
```bash
$ ovhai notebook list

ID                                   NAME            STATE    AGE  FRAMEWORK VERSION                   EDITOR     URL
xxxxxxx-ssss-zzzz-ffff-tttttttttttt jupyterlab-kind RUNNING  65m  conda     conda-py311-cudaDevel11.8 jupyterlab https://xxxxxxx-ssss-zzzz-ffff-tttttttttttt.notebook.gra.ai.cloud.ovh.net
```

### Model creation with AI Notebook

See instructions in the [model creation section](./docs/00-notebook.md) to do transfer learning of YOLOv11 model to play to the game Rock/Paper/Scissors.  

### Model training with AI Training

See instructions in the [training section](./docs/01-training.md) to train the model on a large dataset and GPU.

### Application creation with AI Deploy

See instructions in the [application creation section](./docs/02-application.md) to use the model and play to Rock/Paper/Scissors.