FROM python:3.8-slim-buster

COPY ./backend /usr/src/backend
WORKDIR /usr/src/backend
RUN pip3 install --no-cache-dir -r requirements.txt
WORKDIR /work/

ENTRYPOINT [ "/bin/bash","/usr/src/backend/main.sh" ]