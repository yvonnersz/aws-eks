FROM ubuntu:18.04
WORKDIR /app

# Setup the environment
RUN apt-get update

# Needed for command envsubst to work
RUN apt-get install gettext-base
# Install curl
RUN apt-get install -y curl
# Install unzip
RUN apt-get install -y unzip
# Install vim
RUN apt-get install -y vim

# install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# install eksctl
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
RUN mv /tmp/eksctl /usr/local/bin

