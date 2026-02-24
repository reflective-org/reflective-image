# Inherit from an upstream image
FROM pangeo/pangeo-notebook:2025.01.24

COPY environment.yml /tmp/environment.yml
COPY postBuild /tmp/postBuild

RUN mamba env update --prefix /srv/conda/envs/notebook --file /tmp/environment.yml
RUN bash /tmp/postBuild

RUN ls
