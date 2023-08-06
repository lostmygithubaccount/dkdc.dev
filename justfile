# Justfile

# load environment variables
set dotenv-load

# aliases

# list justfile recipes
default:
    just --list

# setup
setup:
    @pip install -r requirements.txt

# preview
preview:
    quarto preview

# build
build:
    quarto render

# config
config:
    $EDITOR _quarto.yml

# clean
clean:
    rm -r _freeze || true
    rm -r _site || true

# gh
repo:
    gh repo view --web
