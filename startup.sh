#!/bin/bash

# Set up Java environment
if [ ! -d ~/.java ]; then
    echo "Installing Java..."
    curl -Lo java.tar.gz https://download.java.net/java/GA/jdk17.0.8/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.8_linux-x64_bin.tar.gz
    mkdir -p ~/.java
    tar -xzf java.tar.gz -C ~/.java --strip-components=1
    rm java.tar.gz
fi

export PATH="$HOME/.java/bin:$PATH"

# Verify Java installation
java -version

# Run Minecraft server
echo "Starting Minecraft server..."
exec java -Xms1G -Xmx${SERVER_MEMORY}M -jar server.jar nogui