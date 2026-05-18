# vul-detection-images

This repository holds container images to decouple infrastructure from other repositories.

`Dockerfile-Codebadger` contains Codebadger, an MCP tool for Joern.

`Dockerfile-Joern` contains a self-contained Joern static analysis tool.

Inspired by https://github.com/Lekssays/codebadger.

Example `compose.yaml`:

```yaml
name: "vul-detection"
services:
  joern-server:
    build:
      context: .
      dockerfile: Dockerfile-Joern
    image: codebadger-joern-server:0.0.1-SNAPSHOT
    # Codebadger heavily relies on this name
    container_name: codebadger-joern-server
    volumes:
      # Mount playground for CPG storage (shared with host)
      - ../tmp/joern/playground:/playground
    restart: unless-stopped
  codebadger-mcp:
    build:
      context: .
      dockerfile: Dockerfile-Codebadger
    container_name: codebadger-mcp
    image: codebadger-mcp-server:0.0.1-SNAPSHOT
    ports:
      - "${DOCKER_MCP_SERVER_PORT}:4242"
    volumes:
      # MCP copies Git repositories here to share it with Joern
      - ../tmp/joern/playground:/app/playground
      # Application needs access to list of repositories
      - ../assets/scaffolded/git:/app/git
      # DB persistence
      - ../tmp/codebadger/codebadger.db:/app/codebadger.db
      # Application relies on Docker
      - /var/run/docker.sock:/var/run/docker.sock
    depends_on:
      - joern-server
    environment:
      MCP_HOST: "0.0.0.0"
      JOERN_SERVER_HOST: "${DOCKER_JOERN_SERVER_HOST}"
      MAX_REPO_SIZE_MB: "${MAX_REPO_SIZE_MB}"
```
