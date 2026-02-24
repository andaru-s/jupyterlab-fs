FROM quay.io/jupyter/datascience-notebook
USER root
ENV GRANT_SUDO=yes
RUN sudo apt update -y
RUN sudo apt install cmake -y
USER jovyan
COPY req .
RUN pip install -r req
RUN pip install jupyterlab_execute_time
RUN pip install variable-inspector
RUN Rscript -e "install.packages(c('plotly', 'mice', 'corrr', 'haven', 'tidymodels', 'tidyclust', 'infer','klaR'), repos = 'https://cloud.r-project.org/')"
