FROM alpine:3.12

# avoid python printing issues in docker containers.
ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

LABEL version="1.0"

COPY requirements.txt requirements.txt 
RUN pip install -r requirements.txt

WORKDIR /src

COPY service.py .
COPY server.conf .

ENTRYPOINT ["python3", "/src/service.py"]