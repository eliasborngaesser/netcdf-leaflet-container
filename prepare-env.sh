mkdir env 
./utils/dl-frontend.sh
mv frontend env
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/minimal-config.yml -O ./env/config.yml
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/nginx/conf -O ./env/nginx-conf