mkdir netcdf-leaflet
curl https://github.com/eliasborngaesser/netcdf-leaflet-frontend/tarball/master -O ./netcdf-leaflet/frontend.tar
mkdir ./netcdf-leaflet/frontend
tar -xvf ./netcdf-leaflet/frontend.tar -C 'frontend'
mv ./netcdf-leaflet/frontend/*/** ./frontend
Remove-Item ./netcdf-leaflet/frontend/eliasborngaesser-* -Recurse
curl https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/minimal-config.yml -O config.yml
curl https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/nginx/conf -O nginx-conf
