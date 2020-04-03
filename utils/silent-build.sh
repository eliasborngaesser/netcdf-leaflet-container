mkdir build 
./utils/dl-backend.sh
mv backend build
cp Dockerfile build
docker rmi $(docker images -f "dangling=true" -q) -f
docker build --rm -t eliasborngaesser/netcdf-leaflet-container:latest ./build
rm -R build