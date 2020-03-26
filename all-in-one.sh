./silent-build.sh
docker rm geoserver -f
docker run --rm -d -p 8600:8080 --name geoserver -e STABLE_EXTENSIONS=netcdf-plugin kartoza/geoserver:2.16.2
 ./prepare-env.sh
mv ../MZ_Flow_2018-07-22_05.00.00.nc inputFiles
docker run --rm -v $PWD:/work -t netcdf-leaflet-container:latest ./config.yml
docker rmi netcdf-leaflet-container:latest -f
docker rm nginx -f
docker run --rm -d -p 8081:80 --name nginx -v $PWD:/usr/share/nginx/html -v conf:/etc/nginx -t nginx:latest 
python -mwebbrowser http://localhost:8081/app/projects/old/index.html