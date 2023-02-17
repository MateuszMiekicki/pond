FROM python:alpine3.16
WORKDIR frog/app

RUN apk update && \
    # apk add build-base && \
    # apk add postgresql14-plpython3=14.7-r0 --repository=https://dl-cdn.alpinelinux.org/alpine/v3.16/main && \
    apk add git && \
    pip install psycopg2-binary
RUN ls -la
RUN git clone https://github.com/MateuszMiekicki/frog.git
RUN ls -la
RUN pip install --no-cache-dir -r frog/app/requirements.txt

CMD ["ls", "-la"]

CMD ["python", "frog/app/src/main.py"]