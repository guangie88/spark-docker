# Debian based
ARG JAVA_VERSION=8
FROM openjdk:${JAVA_VERSION}-jre-slim

# Spark
# e.g. 2.4.0
ARG SPARK_VERSION=
ARG HADOOP_VERSION="2.7"

ENV SPARK_NAME "spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}"
ENV SPARK_DIR "/opt/${SPARK_NAME}"
ENV SPARK_HOME "/usr/local/spark"

RUN set -eux; \
    # Setup and install 
    if [ -z "${SPARK_VERSION}" ]; then \
        echo "Please set --build-arg SPARK_VERSION for Docker build!" >&2; \
        sh -c "exit 1"; \
    fi; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        # Build-time only deps
        wget; \
    #
    # Spark installation
    #
    wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz; \
    tar zxf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt; \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz; \
    ln -s ${SPARK_DIR} ${SPARK_HOME}; \
    #
    # Remove unnecessary build-time only dependencies
    #
    apt-get remove -y wget; \
    rm -rf /var/lib/apt/lists/*

ENV PATH "${PATH}:${SPARK_HOME}/bin"
