FROM python:alpine3.16
WORKDIR frog/app

RUN apk update && \
    apk add git && \
    pip install psycopg2-binary
RUN git clone https://github.com/Smart-Terrarium/frog.git
RUN pip install --no-cache-dir -r frog/app/requirements.txt

CMD ["python", "frog/app/src/main.py"]