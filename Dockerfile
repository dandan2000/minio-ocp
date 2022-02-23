FROM registry.redhat.io/ubi7/ubi

RUN yum -y install --disableplugin=subscription-manager \
  git \
  && yum --disableplugin=subscription-manager clean all

#RUN curl https://dl.minio.io/server/minio/release/linux-amd64/minio -o /tmp/minio
COPY minio /tmp/minio
COPY LICENSE LICENSE
RUN cd tmp && chmod +x minio && ls /tmp  

EXPOSE 9090
EXPOSE 9000

#USER 1001

ENTRYPOINT ["/tmp/minio"]
CMD ["server", "--console-address",  "0.0.0.0:9090", "/tmp/miniofile" ]
