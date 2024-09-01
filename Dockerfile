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
        build-base \
        nodejs \
        npm \
        openjdk11 && \
    npm install -g @mermaid-js/mermaid-cli && \
    gem install asciidoctor asciidoctor-diagram && \
    echo "server: true" >> /root/.asciidoctorconfig && \
    apk del --purge build-base ruby-dev && \
    yarn cache clean && \
    rm -rf /var/cache/apk/*

# Install PlantUML
RUN curl -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /usr/local/bin/plantuml.jar && \
    echo "java -jar /usr/local/bin/plantuml.jar \$@" > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# Set the working directory
WORKDIR /documents

# Set the entry point for the Antora command
ENTRYPOINT ["antora"]
