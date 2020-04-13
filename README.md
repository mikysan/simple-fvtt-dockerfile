# Simple Dockerfile for Foundry VTT

This repository provides a simple Dockerfile to run [Foundry VTT](https://foundryvtt.com/) with [docker](https://www.docker.com/).

## Installation

Put the `Dockerfile` in the foundryvtt directory you have already downloaded as usual.
Build the image in foundryvtt directory with the command
```shell script
docker build . -t <your username>/foundryvtt
```

Pro tip: whenever you build a new version of Foundry VTT you could tag it with the version number. Than use the tag to run different version.

## Usage

### Run the image

```shell script
docker run --name fvtt -p <your favorite port>:30000 -v <wherever you put the foundrydata directory>:/home/foundry/data -d <your username>/foundryvtt
```

### Stop the image

```shell script
docker stop fvtt && docker container rm fvtt
```

### Check the logs

```shell script
docker logs fvtt
```

## Contributing
Pull requests are very welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
