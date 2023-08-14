FROM python:alpine3.16

RUN apk update && \
    apk add git && \
    pip install psycopg2-binary
RUN git clone https://github.com/Smart-Terrarium/frog.git
WORKDIR frog
RUN pip install --no-cache-dir -r ./app/requirements.txt
RUN pip install --no-cache-dir -r ./notifier/requirements.txt
RUN python ./scripts/generate_cert_for_ssl.py
RUN chmod a+x docker_entrypoint.sh
CMD ["/frog/docker_entrypoint.sh"]
