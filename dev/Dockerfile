FROM centos:7

RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash - \
    && curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo \
    && rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
RUN yum upgrade -y --skip-broken upgrade && yum -y --skip-broken update
RUN yum -y --skip-broken install epel-release \
        git \
        gcc \
        wget \
        curl \
        openssl-devel \
        buildah \
        npm \
        node.js \
        podman \
        python36u \
        python36-libs \
        python36-devel \
        python36-pip \
        python-virtualenv \
        which \
        yarn
RUN yum clean all

# Install systemd -- See https://hub.docker.com/_/centos/
RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*; \
rm -f /etc/systemd/system/*.wants/*; \
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*; \
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN sed -i "s/driver = \"overlay\"/driver = \"vfs\"/g" /etc/containers/storage.conf \
    && sed -i '/^mountopt =.*/d' /etc/containers/storage.conf \
    && sed -i "s/cgroup_manager = \"systemd\"/cgroup_manager = \"cgroupfs\"/g" /usr/share/containers/libpod.conf \
    && sed -i "s/# events_logger = \"journald\"/events_logger = \"file\"/g" /usr/share/containers/libpod.conf \
    && cp -a /usr/share/containers/libpod.conf /etc/containers/ \
    && sed -i "s/cgroup_manager = \"systemd\"/cgroup_manager = \"cgroupfs\"/g" /etc/containers/libpod.conf


RUN pip3 install --upgrade pip
RUN pip3 install awscli pylint ansible ansible-lint pylint-venv
RUN pip3 install git+https://github.com/ansible-community/ansible-bender
RUN yarn global add create-react-app

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
WORKDIR /prj
VOLUME ["/prj"]
VOLUME ["/sys/fs/cgroup"]
ENTRYPOINT ["/entrypoint.sh"]
