FROM python:3.8

WORKDIR /workspace
ADD . /workspace

RUN pip install -r requirements.txt
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

CMD [ "streamlit" , "run" , "/workspace/app.py", "--server.address=0.0.0.0" ]

RUN chown -R 42420:42420 /workspace

ENV HOME=/workspace