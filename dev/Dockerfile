FROM ubuntu:latest
RUN apt-get update -qq && apt-get install -qq -y software-properties-common curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN add-apt-repository -y ppa:projectatomic/ppa
RUN apt-get update && apt-get upgrade
RUN apt-get -qq -y install buildah git iputils-ping nodejs npm podman python3 python3-venv python3-pip sudo vim yarn
RUN apt-get -y autoremove
RUN apt-get clean
RUN useradd -m -d /home/ubuntu -b /home/ubuntu -U -G sudo ubuntu && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir -p /prj/kudos
RUN chown -R ubuntu:ubuntu /prj && chmod -R 775 /prj
COPY .add_to_bashrc /home/ubuntu
RUN cat /home/ubuntu/.add_to_bashrc >> /home/ubuntu/.bashrc && rm /home/ubuntu/.add_to_bashrc
RUN chown -R ubuntu:ubuntu /home/ubuntu && chmod -R 775 /home/ubuntu
RUN rm /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
USER ubuntu
RUN pip install --user awscli pylint ansible ansible-lint ansible-bender pylint-venv
CMD /bin/bash
