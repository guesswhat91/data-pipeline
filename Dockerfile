FROM python:3.7.7-slim-buster

RUN apt-get update && apt-get -y install \
    gcc

ADD requirements.txt /
RUN pip install -r /requirements.txt

ADD data/ /workspace/data
ADD notebooks/ /workspace/notebooks
ADD cloudformation.yaml /workspace/cloudformation.yaml
ADD docker-entrypoint.sh /workspace/docker-entrypoint.sh
RUN chmod +x /workspace/docker-entrypoint.sh

WORKDIR /workspace

EXPOSE 8888

ENTRYPOINT ["/workspace/docker-entrypoint.sh"]
