FROM alpine:3.2
RUN apk update && apk upgrade
RUN apk add git gcc musl-dev libffi-dev python python-dev py-pip

RUN mkdir -p /opt/CTFd
WORKDIR /opt/CTFd

COPY requirements.txt /opt/CTFd
RUN pip install -r requirements.txt

COPY . /opt/CTFd

ENTRYPOINT ["/opt/CTFd/entrypoint.sh"]
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "-w", "4", "--error-logfile", "/opt/CTFd/CTFd/logs/gunicorn_error.log", "--access-logfile", "/opt/CTFd/CTFd/logs/gunicorn_access.log", "CTFd:create_app()"]
EXPOSE 8000
