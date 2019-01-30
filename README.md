# Spark Docker Builder

Dockerfile + Travis cron set-up to install all `2.y.z` versions of Spark in a
minimalist environment, for both slimmed Debian and Alpine. This set-up is set
to run weekly.

The Java version `JAVA_MAJOR_VERSION` defaults to 8, while `SPARK_VERSION` build
argument must be specified.

## Example build and run commands

```bash
JAVA_MAJOR_VERSION=8
SPARK_VERSION=2.4.0

# Build
docker build . \
    --build-arg SPARK_VERSION=${SPARK_VERSION} \
    -t guangie88/spark:${SPARK_VERSION}_java-${JAVA_MAJOR_VERSION}

# Run Spark Shell (Scala)
docker run --rm -it \
    guangie88/spark:${SPARK_VERSION}_java-${JAVA_MAJOR_VERSION} \
    spark-shell
```
