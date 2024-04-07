# Antora Extended Docker Image

This Dockerfile creates an extended Antora Docker image, incorporating essential tools and fonts for documentation projects, including support for AsciiDoc processing and diagram generation. The base is the latest Antora image, supplemented with various utilities and Ruby for enhanced documentation capabilities.

## Features

- **Antora Base**: Uses `antora/antora:latest` as the foundational layer.
- **Enhanced Tooling**: Includes Git, SSH client, Curl, and CA certificates for secure content fetching.
- **Graphviz & Fonts**: Adds Graphviz for diagram rendering, alongside several TrueType fonts (DejaVu, Droid, FreeFont, Liberation) to ensure comprehensive visual compatibility.
- **Ruby & AsciiDoctor**: Integrates Ruby with AsciiDoctor and AsciiDoctor-Diagram gems for advanced document processing.

## Prerequisites

Before you begin, ensure you have Docker installed on your system. For installation guidance, visit [Docker's installation page](https://docs.docker.com/get-docker/).

## Building the Docker Image

To build the image from this Dockerfile, follow these steps:

1. Clone this repository to your machine.
2. Navigate to the directory containing the Dockerfile.
3. Build the image with the following command:

    ```bash
    docker build -t antora-extended .
    ```

## Usage

After building the image, you can use it to run Antora projects. Here's a basic example:

1. Place your Antora playbook and documentation sources in a directory, e.g., `/path/to/docs`.
2. Run the following command, substituting `/path/to/docs` with the path to your documentation directory:

    ```bash
    docker run --rm -v /path/to/docs:/documents antora-extended your-playbook.yml
    ```

This command mounts your documentation directory to the `/documents` directory inside the container and executes Antora with your specified playbook.

## Best Practices

- **Documentation Structure**: Adhere to Antora's recommended project structure for optimal organization and clarity. For more information, visit the [Antora documentation site](https://docs.antora.org/antora/2.3/).
- **Security Updates**: Regularly update the Dockerfile to incorporate the latest versions of Antora, utilities, and Ruby gems to mitigate security vulnerabilities.
- **Customization**: Feel free to modify the Dockerfile to include any additional tools or packages needed for your specific documentation requirements.

## Contributing

Contributions are welcome. If you have suggestions for improvement or have identified bugs, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Additional Resources

- [Antora](https://antora.org/)
- [AsciiDoctor](https://asciidoctor.org/)
- [Docker Documentation](https://docs.docker.com/)
- [Graphviz](https://www.graphviz.org/)
- [Ruby Gems](https://rubygems.org/)

Feel free to explore these resources to enhance your understanding and capabilities with this Docker image.
