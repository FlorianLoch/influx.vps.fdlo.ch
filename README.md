# InfluxDB in Dokku

This repository contains the configuration of the InfluxDB (2) instance running at influx.vps.fdlo.ch.

Add a git remote for Dokku:
```bash
git remote add dokku dokku@vps.fdlo.ch:influx
```

Additionally, some setup with Dokku is necessary:

```bash
dokku apps:create influx
dokku storage:mount influx /apps/influx:/var/lib/influxdb2

cd /apps && mkdir ./influx && sudo chown nobody influx

dokku config:set influx DOCKER_INFLUXDB_INIT_USERNAME=<user> DOCKER_INFLUXDB_INIT_PASSWORD=<password>

dokku network:set influx attach-post-deploy prometheus-bridge

# Apps needs to be deployed once before calling this
dokku proxy:ports-set influx http:80:8086
dokku domains:remove influx influx.fdlo.ch
dokku domains:add influx influx.vps.fdlo.ch

dokku letsencrypt:enable influx
```
