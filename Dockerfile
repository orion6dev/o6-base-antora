# Use a specific version of the Antora image as the base
FROM antora/antora:3.1.9 AS dist

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
        openjdk11 \
        # Additional dependencies for Puppeteer and Chromium
        chromium \
        nss \
        freetype \
        freetype-dev \
        harfbuzz && \
    # Install global npm packages
    npm install -g @mermaid-js/mermaid-cli && \
    # Install gems
    gem install asciidoctor asciidoctor-diagram && \
    # Set AsciiDoctor configuration
    echo "server: true" >> /root/.asciidoctorconfig && \
    # Cleanup unnecessary packages and cache
    apk del --purge build-base ruby-dev && \
    yarn cache clean && \
    rm -rf /var/cache/apk/*

# Set Puppeteer environment variables to instruct it to skip downloading Chromium and use the system-installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
# Install PlantUML using a specific version from GitHub releases
RUN curl -L https://github.com/plantuml/plantuml/releases/download/v1.2024.6/plantuml-1.2024.6.jar -o /usr/local/bin/plantuml.jar && \
    echo "java -jar /usr/local/bin/plantuml.jar \$@" > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# Set the working directory
WORKDIR /documents

# Set the entry point for the Antora command
ENTRYPOINT ["antora"]
