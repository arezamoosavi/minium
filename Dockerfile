FROM python:3.7.6-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV PIP_FORMAT=legacy

RUN apt-get -y update && apt-get install -y python-pip python-dev libzbar-dev bash \
    gcc python3-dev git libc-dev

RUN echo 'deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y netcat && apt-get autoremove -y

RUN adduser --disabled-password --gecos '' myuser

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY ./main /main

CMD ["uvicorn", "main.run_app:app", "--host", "0.0.0.0", "--port", "80"]