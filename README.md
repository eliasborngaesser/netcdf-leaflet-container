# Docker Image for uploading customized NetCDF Files to Geoserver

# Basic
- run Docker daemon
- ensure working dir is mountable by docker
- get latest Docker Image: `docker pull eliasborngaesser/netcdf-leaflet-container:latest`
- run geoserver: `docker run -d -p 8600:8080 --name geoserver -e INITIAL_MEMORY=3G -e STABLE_EXTENSIONS=netcdf-plugin -v $(pwd)/netcdf.projections.properties:/opt/geoserver/data_dir/user_projections/netcdf.projections.properties kartoza/geoserver:2.16.2`
- Download Script to prepare environment: [Shell](https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/prepare-env.sh) | [CMD](https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/prepare-env.bat)
- run script
- copy NetCDF File(s) to "inputFiles" folder  in env Folder ("netcdf-leaflet")
- run netcdf-leaflet-container: `docker run -it --rm --mount type=bind,source="$(pwd)/netcdf-leaflet",target=/work -t eliasborngaesser/netcdf-leaflet-container:latest -p testProject create`
- run nginx: `docker run --rm -d -p 8081:80 --name nginx -v $(pwd)/netcdf-leaflet/frontend:/usr/share/nginx/html -v $PWD/netcdf-leaflet/nginx-conf:/etc/nginx/conf -t nginx:latest`

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
    - `docker run -d -p 8600:8080 --name geoserver -e STABLE_EXTENSIONS=netcdf-plugin -e COMMUNITY_EXTENSIONS=colormap-plugin -v $(pwd)/netcdf.projections.properties:/opt/geoserver/data_dir/user_projections/netcdf.projections.properties kartoza/geoserver:latest`

## Prepare Environment for creating Frontend dynamically
- prepare environment: [Shell](https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/prepare-env.sh) 
- Copy inputFile(s) to "inputFiles" Folder in env Folder ("netcdf-leaflet")

## Running Container
- start docker container with mounting this directory and defining config file
    - `docker run -it --rm --mount type=bind,source="$(pwd)/netcdf-leaflet",target=/work -t netcdf-leaflet-container:latest create`

## Running Frontend
- You may open the displayed index.html directly in your Browser or serve the app with nginx
    - `docker run --rm -d -p 8081:80 --name nginx -v $(pwd)/netcdf-leaflet/frontend:/usr/share/nginx/html -v $PWD/netcdf-leaflet/nginx-conf:/etc/nginx/conf -t nginx:latest`
