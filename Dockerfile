FROM ubuntu:22.04

RUN apt-get update && apt-get -y install curl

# install conda
ENV CONDA_DIR /opt/conda
RUN curl "https://repo.anaconda.com/miniconda/Miniconda3-py310_23.5.2-0-Linux-x86_64.sh" -o "install-conda.sh" && \
    /bin/bash "install-conda.sh" -b -p $CONDA_DIR && \
    rm "install-conda.sh"
ENV PATH=$CONDA_DIR/bin:$PATH

# build conda environment
ADD environment.yml /tmp/deps/environment.yml
RUN conda env create --solver libmamba --file /tmp/deps/environment.yml

WORKDIR /app
ADD . .