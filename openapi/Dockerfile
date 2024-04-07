FROM openapitools/openapi-generator-cli AS jacs-verified-openapi

# Install Rust
USER root
RUN apt-get update && \
    apt-get install -y curl build-essential && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    . $HOME/.cargo/env

# Install your desired Cargo library
RUN $HOME/.cargo/bin/cargo install jacs

# FOR THIS TO WORK YOU NEED TO COPY your jacs.config.json with just your public key, since this image is just verifying.
# COPY myagentfile.json .
# COPY myagent.publickey.pem .
# COPY jacs.config.json .

# Copy a custom script to the container
COPY custom_pre_entrypoint.sh /usr/local/bin/custom_pre_entrypoint.sh
RUN chmod +x /usr/local/bin/jacs_pre_entrypoint.sh

# Modify the entrypoint to run the custom script before the original entrypoint
ENTRYPOINT ["/usr/local/bin/jacs_pre_entrypoint.sh"]
