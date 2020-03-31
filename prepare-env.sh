folder=netcdf-leaflet
mkdir $folder 
./utils/dl-frontend.sh
mv frontend $folder
curl -L  -o "$folder/config.yml" 'https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/minimal-config.yml'
curl -L  -o "$folder/nginx-conf" 'https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/nginx/conf'