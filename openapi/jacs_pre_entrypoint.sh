#!/bin/bash

openapi_spec_path=""

# Loop through arguments and check for "-i" followed by another argument
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -i)
        openapi_spec_path="$2"
        shift # past argument
        shift # past value
        ;;
        *)    # unknown option
        shift # past argument
        ;;
    esac
done

# Check if the OpenAPI spec path was provided
if [ -z "$openapi_spec_path" ]; then
    echo "Error: OpenAPI spec path not provided with -i argument."
    exit 1
fi

# Run your custom command here, passing the OpenAPI spec path
echo "Running JACS Verifier with OpenAPI spec: $openapi_spec_path"

jacs verify document -d "$openapi_spec_path"

if [ $? -ne 0 ]; then
    echo "Error: JACS VALIDATION  failed. Aborting."
    exit 1
fi

# Now, execute the original docker-entrypoint.sh with all passed arguments
exec /usr/local/bin/docker-entrypoint.sh "$@"
