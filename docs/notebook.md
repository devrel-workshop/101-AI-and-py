## Instructions to create the JupyterLab Notebook

### Object storage creation

Create two Swift object storage: 
  - type: private
  - name: `101-ai-lab-model` & `101-ai-lab-data`

### Notebook creation

Use the CLI to create the Notebook (at this time it's the only way to use private GitHub repository):
```bash
ovhai notebook run conda jupyterlab \
    --name 101-ai-lab-notebook \
    --gpu 1 \
    --volume 101-ai-lab-data@GRA:/workspace/data:RWD \
    --volume 101-ai-lab-model@GRA:/workspace/model:RWD \
	  --volume https://<user>:<token>@github.com/devrel-workshop/101-AI-and-py.git:/workspace/101-ai-lab-sources:RWD
```