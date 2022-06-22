FROM influxdb:2.3.0-alpine

USER nobody

# Dokku will pick this up
EXPOSE 8086

ENV DOCKER_INFLUXDB_INIT_ORG=vps.fdlo.ch
ENV DOCKER_INFLUXDB_INIT_BUCKET=bucket

# The following get set via Dokku's config system
# Seems like influxdb is ignoring these...
# DOCKER_INFLUXDB_INIT_USERNAME=<user>
# DOCKER_INFLUXDB_INIT_PASSWORD=<password>

