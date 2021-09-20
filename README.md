# signal-desktop-docker-vnc

## Run

```bash
docker run -d -p 6080:80 -v /dev/shm:/dev/shm -v signal-data:/root/.config/Signal louislam/signal-desktop-docker-vnc
```

## Update

```bash
docker pull louislam/signal-desktop-docker-vnc
```

## Build

```bash
npm run build-docker
```


## Update Docker Remarks

1. package.json: update the version number
2. dockerfile: update the version number