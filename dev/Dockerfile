FROM docker:latest
RUN apk update
RUN apk upgrade
RUN apk --no-cache add curl bash sudo git python3 gcc python3-dev libc-dev libffi-dev \
  openssh openssl-dev wget unzip which
RUN curl https://releases.hashicorp.com/packer/1.4.5/packer_1.4.5_linux_amd64.zip -o packer_1.4.5_linux_amd64.zip
RUN unzip packer_1.4.5_linux_amd64.zip
RUN chmod 775 packer
RUN mv packer /usr/bin
RUN rm -f packer_1.4.5_linux_amd64.zip
RUN pip3 install --upgrade pip
RUN pip3 install awscli pylint ansible ansible-lint pylint-venv

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
WORKDIR /prj
VOLUME ["/prj"]
ENTRYPOINT ["/entrypoint.sh"]
