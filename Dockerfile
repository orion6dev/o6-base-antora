# Use the latest Antora image as the base
FROM antora/antora:latest as dist

# Update the package list and install necessary dependencies
RUN apk update && \
    apk add --no-cache \
        git \
        openssh-client \
        curl \
        ca-certificates \
        gnupg \
        graphviz \
        ttf-dejavu \
        ttf-droid \
        ttf-freefont \
        ttf-liberation \
        ruby \
        ruby-dev \
        build-base && \
    gem install asciidoctor asciidoctor-diagram && \
    apk del build-base ruby-dev && \
    yarn cache clean

# Optionally set the working directory
WORKDIR /documents

# Set the entry point for the Antora command
ENTRYPOINT ["antora"]
