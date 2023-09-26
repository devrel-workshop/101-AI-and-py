## Instructions to create the JupyterLab Notebook

### Object storage creation

Create two Swift object storage: 
  - type: private
  - name: `101-ai-lab-model` & `101-ai-lab-data`

### Notebook creation

  - authenticate with `ovhai` CLI: `ovhai login`
  - Use the CLI to create the Notebook (at this time it's the only way to use private GitHub repository):
```bash
ovhai notebook run conda jupyterlab \
	--name 101-ai-lab-notebook \
	--gpu 1 \
	--volume 101-ai-lab-data@GRA:/workspace/data:RW \
	--volume 101-ai-lab-model@GRA:/workspace/model:RW \
  --volume https://github.com/devrel-workshop/101-AI-and-py.git:/workspace/101-ai-lab-sources:RW
```
  - Connect to the created Notebook
  - create the directory `new-images` in `/workspace/data/rock-paper-scissors`
  - upload a test image of you doing a `scissor`, or take the one in assets [scissors](./assets/scissors.jpg)
  - follows the steps to play the Notebook
    - ⚠️ the first step to download and unzip is optional and needed only when you start from a fresh installation with no data ⚠️
    - ⚠️ the last step to save the model is optional because the real model will be the one after the training phase ⚠️
