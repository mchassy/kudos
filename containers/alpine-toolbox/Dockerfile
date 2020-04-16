FROM docker:latest
WORKDIR /prj
RUN apk update
RUN apk upgrade
RUN apk --no-cache add curl bash sudo git python3 gcc python3-dev libc-dev libffi-dev npm \
  openssh openssl-dev rsync wget unzip which yarn
RUN curl https://releases.hashicorp.com/packer/1.4.5/packer_1.4.5_linux_amd64.zip -o packer_1.4.5_linux_amd64.zip
RUN unzip packer_1.4.5_linux_amd64.zip
RUN chmod 775 packer
RUN mv packer /usr/bin
RUN rm -f packer_1.4.5_linux_amd64.zip
RUN pip3 install --upgrade pip
RUN pip3 install awscli pylint ansible ansible-lint pylint-venv
RUN echo -e '#!/bin/bash\nls -al' > /usr/bin/ll && chmod +x /usr/bin/ll
RUN mkdir /scripts
COPY ./scripts/.profile /scripts/.profile
RUN chmod +x /scripts/.profile
COPY ./scripts/entrypoint.sh /
RUN chmod +x /entrypoint.sh
VOLUME ["/prj"]
ENTRYPOINT ["/entrypoint.sh"]
