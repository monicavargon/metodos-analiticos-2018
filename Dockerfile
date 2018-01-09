FROM rocker/verse:3.4.3

RUN install2.r --error \
	--deps TRUE \
	sparklyr 

RUN r -e 'sparklyr::spark_install()'

RUN mkdir /home/rstudio/.cache \
  && mv /root/spark/ /home/rstudio/.cache \
  && chown -R rstudio:rstudio /home/rstudio/.cache
ENV RSTUDIO_SPARK_HOME /home/rstudio/.cache/spark/spark-2.0.2-bin-hadoop2.7

RUN install2.r --error \
	arules \
	arulesViz 
