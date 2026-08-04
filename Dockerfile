# Inherit from an upstream image
FROM pangeo/pangeo-notebook:2025.01.24

COPY environment.yml /tmp/environment.yml
COPY postBuild /tmp/postBuild
COPY images/ /opt/reflective/images/
COPY jupyter_lab_config.py /tmp/jupyter_lab_config.py
COPY custom/custom.css /tmp/custom.css

RUN mamba env update --prefix /srv/conda/envs/notebook --file /tmp/environment.yml
RUN mkdir -p /srv/conda/envs/notebook/etc/jupyter/custom \
    && cp /tmp/jupyter_lab_config.py /srv/conda/envs/notebook/etc/jupyter/jupyter_lab_config.py \
    && cp /tmp/custom.css /srv/conda/envs/notebook/etc/jupyter/custom/custom.css
RUN bash /tmp/postBuild

RUN ls
