FROM python:alpine3.16

RUN apk update && \
    apk add git && \
    pip install psycopg2-binary
RUN git clone https://github.com/Smart-Terrarium/frog.git
WORKDIR frog
RUN pip install --no-cache-dir -r ./app/requirements.txt

CMD ["python", "./app/src/main.py","--frog_config" ,"./configuration/private/template/frog.properties","--databases_config" ,"./configuration/private/template/databases.properties", "--mailer_config" ,"./configuration/private/template/mailer.properties"]