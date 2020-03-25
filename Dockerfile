FROM python:3.8-slim-buster

WORKDIR /usr/src/
COPY ./backend ./backend
WORKDIR /usr/src/backend
RUN pip3 install --no-cache-dir -r requirements.txt
WORKDIR /tmp/
ENTRYPOINT [ "/bin/sh", "/usr/src/backend/demo.sh" ]
