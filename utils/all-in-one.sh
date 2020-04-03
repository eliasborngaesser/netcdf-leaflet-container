./utils/silent-build.sh
docker rm geoserver -f
docker run --rm -d -p 8600:8080 --name geoserver -e STABLE_EXTENSIONS=netcdf-plugin kartoza/geoserver:2.16.2
 ./prepare-env.sh
docker run -it --rm --mount type=bind,source="$(pwd)/netcdf-leaflet",target=/work -t eliasborngaesser/netcdf-leaflet-container:latest -p test create
docker rm nginx -f
docker run --rm -d -p 8081:80 --name nginx -v $(pwd)/netcdf-leaflet/frontend:/usr/share/nginx/html -v $PWD/netcdf-leaflet/nginx-conf:/etc/nginx/conf -t nginx:latest
python -mwebbrowser http://localhost:8081/app/projects/test1/index.html