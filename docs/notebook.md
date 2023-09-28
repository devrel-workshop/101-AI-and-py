## Instructions to create the JupyterLab Notebook

### Initialisation of the cloud resources

  - get the Openstack user
  - get the object storage name

### Notebook creation

  - authenticate with `ovhai` CLI: `ovhai login`
  - Use the CLI to create the Notebook (at this time it's the only way to use private GitHub repository):
```bash
ovhai notebook run conda jupyterlab \
 --name attendee-$STUDENT_ID-ai-lab-notebook \
 --gpu 1 \
 --volume attendee-$STUDENT_ID-data@GRA:/workspace/attendee:RW:cache \
 --volume https://github.com/devrel-workshop/101-AI-and-py.git:/workspace/101-ai-lab-sources:RO
```
  - Connect to the created Notebook
  - launch the initialisation script: `/workspace/101-ai-lab-sources/init_ai_env.sh`
  - open the Notebook `/workspace/attendee/rock-paper-scissors.ipynb`
  - follow the instructions in the notebook
    - the roboflow URL: `https://universe.roboflow.com/ds/CfbtXZ5S1M?key=xxxx`