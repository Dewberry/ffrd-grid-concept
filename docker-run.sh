#!/bin/bash

set -euo pipefail

docker build -t ffrd-grid-concept .

set -x

# docker run -v $PWD/data:/app/data ffrd-grid-concept /opt/conda/envs/ffrd-grid-concept/bin/jupyter nbconvert --to script --execute 01-preprocess.ipynb
# docker run -v $PWD/data:/app/data ffrd-grid-concept /opt/conda/envs/ffrd-grid-concept/bin/jupyter nbconvert --to script --execute 02-analyze.ipynb
# docker run -v $PWD/data:/app/data ffrd-grid-concept /opt/conda/envs/ffrd-grid-concept/bin/jupyter nbconvert --to script --execute 03-visualization.ipynb
docker run -v $PWD/data:/app/data -e WRITE_PLOTS=1 ffrd-grid-concept /opt/conda/envs/ffrd-grid-concept/bin/jupyter nbconvert --to script --execute 04-extract.ipynb
# docker run -v $PWD/data:/app/data ffrd-grid-concept /opt/conda/envs/ffrd-grid-concept/bin/jupyter nbconvert --to script --execute 05-interpolate.ipynb
