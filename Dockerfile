FROM ubuntu:latest
ENV PATH="/opt/conda/bin:${PATH}"
ARG PATH="/opt/conda/bin:${PATH}"
RUN apt-get update && apt-get install -y \
	wget \
	bash

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    mkdir /opt/.conda && \
    bash Miniconda2-latest-Linux-x86_64.sh -f -b -p /opt/conda && \
    rm -f Miniconda2-latest-Linux-x86_64.sh
    
RUN conda config --set allow_conda_downgrades true  &&\
	conda install -y conda=4.6.14 && \
	conda create -y -n qiime1 python=2.7 qiime matplotlib=1.4.3 mock nose -c bioconda

CMD ["bin/bash"]