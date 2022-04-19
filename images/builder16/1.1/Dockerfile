FROM ubuntu:16.04
LABEL Sergey Nikolayenko <sergiy_nikolayenko6446@jabil.com>
RUN apt-get update
RUN echo -e "2\n105\n" | apt-get install tzdata
RUN apt-get -y install sudo python
RUN apt-get -y install sudo gawk wget git-core diffstat unzip texinfo \
    gcc-multilib build-essential chrpath socat libsdl1.2-dev xz-utils \
    xterm sed cvs subversion coreutils texi2html docbook-utils python-pysqlite2 help2man gcc \
    g++ make desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
    mercurial autoconf automake groff curl lzop asciidoc u-boot-tools libncurses5-dev \
    gcc-arm-none-eabi cmake software-properties-common mc \
    gnupg flex bison gperf zip libffi-dev ccache \
    curl zlib1g-dev libc6-dev lib32z-dev \
    libx11-dev g++-multilib libxml-simple-perl aptitude \
    tofrodos python-markdown libxml2-utils xsltproc uuid-dev

RUN aptitude install libssl-dev -y

RUN curl https://storage.googleapis.com/git-repo-downloads/repo-1 > /usr/bin/repo
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 10
RUN apt-get install -y cpio locales
RUN locale-gen "en_US.UTF-8"
RUN update-locale LANG=en_US.UTF-8
RUN /usr/sbin/update-ccache-symlinks

COPY ./setup.sh /setup.sh
COPY ./toolchain.tar /home/toolchain.tar

RUN /setup.sh
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
RUN sudo apt-get install git-lfs

COPY docker_shell /bin/docker_shell
COPY container-id /bin/container-id


COPY ./nhlos_build.sh /bin/nhlos_build.sh
COPY ./android_build.sh /bin/android_build.sh
RUN apt-get -y install vim mc nano iputils-ping bc