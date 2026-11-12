FROM mambaorg/micromamba:2.3.2

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml

ENV MAMBA_ROOT_PREFIX=/opt/conda
ENV CONDA_PKGS_DIRS=/home/mambauser/.mamba/pkgs

RUN --mount=type=bind,from=mamba_cache,source=.,target=/tmp/mamba-cache,ro \
    --mount=type=cache,id=asm-gasom-mamba-cache,target=/home/mambauser/.mamba/pkgs,uid=57439,gid=57439 \
    cp -r /tmp/mamba-cache/cache /home/mambauser/.mamba/pkgs/ && \
    find /tmp/mamba-cache -maxdepth 1 -type f \( -name '*.conda' -o -name '*.tar.bz2' \) \
      -exec cp {} /home/mambauser/.mamba/pkgs/ \; && \
    micromamba create -y -v -n workshop -f /tmp/environment.yml

USER root
RUN mkdir -p /home/workshop/data /home/workshop/scripts /home/workshop/results && \
    chown -R $MAMBA_USER:$MAMBA_USER /home/workshop
USER $MAMBA_USER

COPY --chown=$MAMBA_USER:$MAMBA_USER data/ /home/workshop/data/
COPY --chown=$MAMBA_USER:$MAMBA_USER scripts/ /home/workshop/scripts/
COPY --chown=$MAMBA_USER:$MAMBA_USER README.md /home/workshop/README.md

WORKDIR /home/workshop

ENV ENV_NAME=workshop
ENV MAMBA_DOCKERFILE_ACTIVATE=1

CMD ["/bin/bash"]
