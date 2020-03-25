# Docker Image for uploading customized NetCDF Files to Geoserver
## Build Docker Image
- Run Shell Script to download backend Repository (dl-backend.sh)
- Run Docker Build:
    - docker build -t netcdf-leaflet-container .

## Start Geoserver
- If you want to start your geoserver locally you can do this by the following docker command
    - docker run -d -p 8600:8080 --name geoserver -e STABLE_EXTENSIONS=netcdf-plugin kartoza/geoserver:2.16.2

## Prepare Environment
- Run ShellScript to prepare Environment(prepare-env.sh)
- copy netcdf File to input Folder
- edit config file (Define at least the input .nc File name)

## Running Container
- start docker container with mounting this directory and defining config file
    - docker run -v $PWD:/usr/src/backend -t netcdf-leaflet-container:latest ./config.yml

## Running Frontend
- You may open the displayed index.html directly in your Browser or serve the app with nginx
    - docker run -p 8081:80 -v $PWD:/usr/share/nginx/html -v conf:/etc/nginx -t nginx:latest
