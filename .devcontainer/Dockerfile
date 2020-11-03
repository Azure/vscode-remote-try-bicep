# Find the Dockerfile for mcr.microsoft.com/azure-functions/dotnet:3.0-dotnet3-core-tools at this URL
# https://github.com/Azure/azure-functions-docker/blob/master/host/3.0/buster/amd64/dotnet/dotnet-core-tools.Dockerfile
FROM mcr.microsoft.com/azure-functions/dotnet:3.0-dotnet3-core-tools
# Start from the dotnet base image to allow easy install of Powershell and ensure common tools are available for things like the bicep language server.

# Configure the release version of Bicep you'd like to use
ARG BICEP_VERSION=latest

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install common tooling
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends curl build-essential

# Install Azure Powershell
ENV PATH="$PATH:/root/.dotnet/tools"
RUN \
    dotnet tool install -g powershell \
    && pwsh -c "Install-Module -Name Az -AllowClobber -Scope AllUsers -Force"

# Install Bicep
RUN \
    # Fetch the latest Bicep CLI binary
    curl -Lo bicep https://github.com/Azure/bicep/releases/${BICEP_VERSION}/download/bicep-linux-x64 \
    # Mark it as executable
    && chmod +x ./bicep \
    # Add bicep to your PATH (requires admin)
    && mv ./bicep /usr/local/bin/bicep \
    # Verify you can now access the 'bicep' command
    && bicep --help \
    # Download the bicep vscode extension for installation
    && curl -Lo vscode-bicep.vsix https://github.com/Azure/bicep/releases/${BICEP_VERSION}/download/vscode-bicep.vsix