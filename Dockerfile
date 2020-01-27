FROM r-base:3.6.2

LABEL maintainer="Ruijia(Ray) Wang <Ruijia.Wang@umassmed.edu>"

RUN apt-get update && apt-get install -y --no-install-recommends \
                ghostscript \
                lmodern \
                pandoc-citeproc \
                qpdf \
                pandoc \
                r-cran-formatr \
                r-cran-ggplot2 \
                r-cran-knitr \
		r-cran-rmarkdown \
                r-cran-runit \
                r-cran-testthat \
                texinfo \
                texlive-fonts-extra \
                texlive-fonts-recommended \
                texlive-latex-extra \
                texlive-latex-recommended \
                texlive-luatex \
                texlive-plain-generic \
                texlive-science \
                texlive-xetex \
		unzip libsqlite3-dev libbz2-dev libssl-dev python python-dev \
                python-pip git libxml2-dev software-properties-common wget tree vim sed \
                subversion g++ gcc gfortran libcurl4-openssl-dev curl zlib1g-dev build-essential \
		libffi-dev  \
        && install.r binb linl pinp tint 

RUN pip install pip
RUN pip install -U setuptools
RUN pip install multiqc
RUN R --slave -e "install.packages(c('BiocManager','devtools', 'gplots', 'R.utils', 'Seurat', 'rmarkdown', 'RColorBrewer', 'Cairo','dplyr','tidyr','magrittr','matrixStats','readr','openxlsx','PerformanceAnalytics','pheatmap','gridExtra','dendextend','scales','ggrepel'), dependencies = TRUE, repos='https://cloud.r-project.org')"
RUN R --slave -e "BiocManager::install(c('BiocParallel','GenomicAlignments', 'GenomicRanges','rtracklayer', 'Rsamtools','limma','edgeR','org.Mm.eg.db','org.Hs.eg.db','org.Ce.eg.db','org.Dm.eg.db','ChIPseeker','clusterProfiler','APAlyzer','DESeq2'))"   
RUN mkdir -p /nl
RUN mkdir -p /project
RUN mkdir -p /share
#X11 display fix
#Xvfb :0 -ac -screen 0 1960x2000x24 &
