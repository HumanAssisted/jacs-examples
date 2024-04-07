# OPENAPI

Use case: you have an AI generating changes to an API and you want to make sure each version was written by only one agent.

Here we use the CLI for JACS instead of

# using JACS CLI

Maybe you want a venv

    pyenv install 3.12
    pyenv virtualenv 3.12 jacs-examples

Now install the [generator](https://github.com/OpenAPITools/openapi-generator-cli)

    pip install openapi-generator-cli

Now install jacs

    cargo install jacs


## create your JACS agent

     jacs agent create ./examples/raw/myjacskfile.new.json --create-keys true

Now update your `jacs.config.json.`

For more documentation see [JACS.](https://github.com/HumanAssisted/JACS)

## sign documents

    jacs document create -f books.api.json -o signed.books.api.json


    jacs document create -f complex.api.json -o signed.complex.api.json


## generate apis

Now you can build your APIs per usual, except now the agent verifies the signature of the file or fails out


    jacs document verify -f signed.books.api.json && \
    openapi-generator generate -i books.api.json -g python-flask -o ./books

or

    jacs document verify -f signed.complex.api.json && \
    openapi-generator generate -i complex.api.json -g python-flask -o ./article-user

## update documents


## generate again



## verifying signature in a custom docker images

UNTESTED, example only.

    docker build -t jacs_validate_service .

    docker run --rm -v ${PWD}:/local jacs_validate_service generate \
    -i /local/complex.signed.json \
    -g python \
    -o /local/out/python_client




