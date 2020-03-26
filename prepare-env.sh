mkdir inputFiles
mkdir outputFiles
mkdir outputFiles/styles
curl -O https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-backend/develop/conf/config.yml 
mkdir frontend
curl -L https://github.com/eliasborngaesser/netcdf-leaflet-frontend/tarball/develop | tar xz --strip=1   -C frontend
mv nginx/conf conf