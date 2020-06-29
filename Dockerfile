FROM centos:7

LABEL Vendor=”CentOS” \
    License=GPLv2 \
    Version=2.4.6–40

RUN yum -y update \
    &&  yum -y install epel-release \
    &&  yum -y install gcc openssl-devel bzip2-devel libffi-devel

RUN yum update -y && yum -y install yum-utils && yum -y groupinstall development

RUN yum -y update \
    &&  yum install -y python37u python3-libs python3-devel python3-setuptools python3-pip


# Add the user UID:1000, GID:1000, home at /app
RUN groupadd -r app -g 1000 && useradd -u 1000 -r -g app -m -d /app -s /sbin/nologin -c "App user" app && \
    chmod 755 /app

COPY requirements.txt /requirements.txt
RUN pip3 install --no-cache-dir -r /requirements.txt

RUN mkdir -p /main

COPY ./main /main

RUN chmod +x main/run.sh

WORKDIR /main

CMD [ "/run.sh" ]
EXPOSE 3000
