mkdir build 
./dl-backend.sh
mv backend build
cp Dockerfile build
docker build --rm -t netcdf-leaflet-container:latest ./build
rm -R build