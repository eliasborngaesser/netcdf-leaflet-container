folder=netcdf-leaflet
mkdir $folder
mkdir $folder/inputFiles
echo "Place yout input .nc Files in this Folder" > $folder/inputFiles/README.txt
./utils/dl-frontend.sh
mv frontend $folder
curl -L  -o "$folder/config.yml" 'https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/minimal-config.yml'
curl -L  -o "$folder/nginx-conf" 'https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/nginx/conf'
curl -L  -o "netcdf.projections.properties" 'https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/netcdf.projections.properties'