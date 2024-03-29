ARG NODE_VERSION=lts

FROM node:$NODE_VERSION-bullseye-slim
ARG KLOTHO_VERSION=latest
ARG TARGETARCH

# Install Dependencies
RUN apt-get update; \
    apt-get install -y \
      curl \
      unzip \
      groff \
      less \
      libc6 \
      ca-certificates \
      gnupg \
      lsb-release

# Install Docker
RUN curl -fsSL https://get.docker.com | sh

# Install Pulumi CLI
RUN curl -fsSL https://get.pulumi.com | sh; \
    mv ~/.pulumi /usr/local
ENV PATH="$PATH:/usr/local/.pulumi/bin"
RUN pulumi login --local

# Install AWS CLI v2
RUN export AWS_CLI_ARCH="x86_64"; \
    if [ "${TARGETARCH}" -eq "arm64" ]; then export AWS_CLI_ARCH="aarch64"; fi; \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-${AWS_CLI_ARCH}.zip" -o "awscliv2.zip"; \
    unzip awscliv2.zip; \
    ./aws/install

# Install Klotho
RUN export KLOTHO_URL="http://srv.klo.dev/update/latest/linux/$(uname -m)?stream=pro:${KLOTHO_VERSION}"; \
    if [ "${KLOTHO_VERSION}" -eq "latest" ]; then export KLOTHO_URL="http://srv.klo.dev/update/latest/linux/$(uname -m)?stream=pro:latest";  fi;  \
    cd /bin; \
    echo $KLOTHO_URL; \
    curl -fsSL "${KLOTHO_URL}" -o klotho; \
    chmod +x klotho

# Upgrade NPM
RUN npm install -g npm@latest

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["klotho", "--version"]
