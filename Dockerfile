FROM python:3.9-slim-buster

RUN apt-get update \
 && apt-get install -y build-essential

RUN pip install --user --trusted-host pypi.org --no-cache-dir pippin-wallet==1.1.20

CMD "/root/.local/bin/pippin-server"
