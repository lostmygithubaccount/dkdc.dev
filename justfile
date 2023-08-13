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

# resize thumbnail
resize:
    sips -Z 256 thumbnail.png --out thumbnail.png

# clean
clean:
    rm -r _freeze || true
    rm -r _site || true

# gh
repo:
    gh repo view --web
