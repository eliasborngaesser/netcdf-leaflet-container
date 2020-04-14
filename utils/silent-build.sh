if [ ! $1 ]; then
    echo "Usage: $0 <IMAGEVERSION>"
    exit 1
fi
mkdir build
./utils/dl-backend.sh
mv backend build
cp Dockerfile build
docker rmi $(docker images -f "dangling=true" -q) -f
docker build --rm -t eliasborngaesser/netcdf-leaflet-container:$1 ./build
rm -R build
if [ $2 = 'push' ]; then
    docker push eliasborngaesser/netcdf-leaflet-container:$1
fi