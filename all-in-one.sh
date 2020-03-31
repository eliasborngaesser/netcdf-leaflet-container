./silent-build.sh
docker rm geoserver -f
docker run --rm -d -p 8600:8080 --name geoserver -e STABLE_EXTENSIONS=netcdf-plugin kartoza/geoserver:2.16.2
 ./dl-frontend.sh
docker run --rm --mount type=bind,source="$(pwd)",target=/work -t netcdf-leaflet-container:latest -c minimal-config.yml -i inputFiles/MZ_Flow_2018-07-22_05.00.00-new.nc -p test
docker rm nginx -f
docker run --rm -d -p 8081:80 --name nginx -v $PWD/frontend:/usr/share/nginx/html -v $PWD/nginx/conf:/etc/nginx/conf -t nginx:latest 
python -mwebbrowser http://localhost:8081/app/projects/test/index.html