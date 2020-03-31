# Docker Image for uploading customized NetCDF Files to Geoserver

# Basic
- run Docker daemon
- ensure working dir is mountable by docker
- get latest Docker Image: `docker pull eliasborngaesser/netcdf-leaflet-container:latest`
- run geoserver: `docker run -d -p 8600:8080 --name geoserver -e STABLE_EXTENSIONS=netcdf-plugin kartoza/geoserver:2.16.2`
- prepare env: [Shell](./prepare-env.sh/download) | [PowerShell](./prepare-env.ps1/download) and change directory to environment folder
- run netcdf-leaflet-container: `docker run --rm --mount type=bind,source="$(pwd)/env",target=/work -t netcdf-leaflet-container:latest -c config.yml -i PathToNetCDF.nc -p ProjectName`
- run nginx: `docker run --rm -d -p 8081:80 --name nginx -v $PWD/frontend:/usr/share/nginx/html -v $PWD/nginx-gitconf:/etc/nginx/conf -t nginx:latest`

# Advanced

## Download this directory
- `mkdir env`
- `curl -L https://github.com/eliasborngaesser/netcdf-leaflet-container/tarball/master | tar xz --strip=1  env`
## Build Docker Image
- Build Image silently:
    - run [silent-build.sh](./utils/silent-build.sh) inside Directory with DockerFile
- You may also configure the backend source code before building the Image
    - Run Shell Script to download backend Repository [dl.backend.sh](./utils/dl-backend.sh)
    - Run Docker Build:
        - `docker build --rm -t netcdf-leaflet-container .`

## Start Geoserver
- If you want to start your geoserver locally you can do this by the following docker command
    - `docker run -d -p 8600:8080 --name geoserver -e STABLE_EXTENSIONS=netcdf-plugin kartoza/geoserver:2.16.2`

## Prepare Environment for creating Frontend dynamically
- Download Frontend [dl-fronted.sh](./utils/dl-frontend).sh)
- edit config file (Define at least the input .nc File name)

## Running Container
- start docker container with mounting this directory and defining config file
    - `docker run --rm --mount type=bind,source="$(pwd)",target=/work -t netcdf-leaflet-container:latest -c ConfigFile.yml -i relativePathToNetCDF.nc -p ProjectName`

## Running Frontend
- You may open the displayed index.html directly in your Browser or serve the app with nginx
    - `docker run --rm -d -p 8081:80 --name nginx -v $PWD/frontend:/usr/share/nginx/html -v $PWD/nginx/conf:/etc/nginx/conf -t nginx:latest`
