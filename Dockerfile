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
        ttf-liberation && \
    yarn cache clean && \
    yarn global add @asciidoctor/core asciidoctor-plantuml

# Optionally set the working directory
WORKDIR /documents

# Set the entry point for the Antora command
ENTRYPOINT ["antora"]
