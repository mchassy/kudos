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
COPY .pylintrc /home/ubuntu
RUN echo "export FLASK_APP=/prj/kudos/kudos_oss/app/http/api/endpoints.py" >> /home/ubuntu/.bashrc
RUN echo "export APP_CONFIG_FILE=/prj/kudos/config/development.py" >> /home/ubuntu/.bashrc
RUN echo "export FLASK_ENV=development" >> /home/ubuntu/.bashrc
RUN echo "export LC_ALL=C.UTF-8" >> /home/ubuntu/.bashrc
RUN echo "export LANG=C.UTF-8" >> /home/ubuntu/.bashrc
RUN chown -R ubuntu:ubuntu /prj && chmod -R 775 /prj
RUN chown -R ubuntu:ubuntu /home/ubuntu && chmod -R 775 /home/ubuntu
RUN rm /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
USER ubuntu
RUN pip install --user pylint ansible ansible-lint ansible-bender pylint-venv
RUN echo "export PATH=/home/ubuntu/.local/bin/:$PATH" >> /home/ubuntu/.bashrc
RUN echo "cd /prj" >> /home/ubuntu/.bashrc
RUN echo "source /prj/env/bin/activate" >> /home/ubuntu/.bashrc
CMD /bin/bash
