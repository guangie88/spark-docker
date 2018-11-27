# Spark Docker Builder

Dockerfile setup to install various versions of Spark in a minimalist
environment.

The Java version `JAVA_VERSION` defaults to 8, while `SPARK_VERSION` build
argument must be specified.

## Example build and run commands

```bash
JAVA_VERSION=8
SPARK_VERSION=2.4.0

# Build
docker build . \
    --build-arg SPARK_VERSION=${SPARK_VERSION} \
    -t guangie88/spark:spark-${SPARK_VERSION}_java-${JAVA_VERSION}

# Run Spark Shell (Scala)
docker run --rm -it \
    guangie88/spark:spark-${SPARK_VERSION}_java-${JAVA_VERSION} \
    spark-shell
```
