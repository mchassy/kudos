FROM centos:7

RUN yum -y install epel-release \
    && yum install -y \
        git \
        gcc \
        wget \
        curl \
        openssl-devel \
        buildah \
        podman \
        python36u \
        python36-libs \
        python36-devel \
        python36-pip \
        python-virtualenv \
    && yum clean all

RUN pip3 install --upgrade pip
RUN pip3 install awscli pylint ansible ansible-lint ansible-bender pylint-venv


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

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
WORKDIR /builds/mapu/kudos
VOLUME ["/builds/mapu/kudos"]
VOLUME ["/sys/fs/cgroup"]
ENTRYPOINT ["/entrypoint.sh"]
