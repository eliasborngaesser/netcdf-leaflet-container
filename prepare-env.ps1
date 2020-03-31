$folder=netcdf-leaflet
mkdir $folder
curl https://github.com/eliasborngaesser/netcdf-leaflet-frontend/tarball/master -O ./$folder/frontend.tar
mkdir ./$folder/frontend
tar -xvf ./$folder/frontend.tar -C "./$folder/frontend"
Remove-Item frontend.tar
mv ./$folder/frontend/*/** ./frontend
Remove-Item ./$folder/frontend/eliasborngaesser-* -Recurse
curl https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/minimal-config.yml -O config.yml
curl https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/nginx/conf -O nginx-conf
