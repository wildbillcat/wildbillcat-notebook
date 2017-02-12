FROM jupyter/datascience-notebook

LABEL Description="This just crams some extra goodies into jupyter/datascience-notebook" Vendor="wildbilcat"

USER root


# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    r-cran-rmysql
	
	
RUN echo 'install.packages(c("RMySQL", "GetoptLong", "lubridate", "plyr"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \
    && Rscript /tmp/packages.R