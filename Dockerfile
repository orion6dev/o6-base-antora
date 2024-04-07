# Use a specific version of the Antora image as the base
FROM antora/antora:2.3.4 as dist

# Update the package list, install necessary dependencies, and perform cleanup in a single layer
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
    apk del --purge build-base ruby-dev && \
    yarn cache clean && \
    rm -rf /var/cache/apk/*

# Set the working directory
WORKDIR /documents

# Set the entry point for the Antora command
ENTRYPOINT ["antora"]
