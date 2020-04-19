branch=$1
mkdir frontend
curl -L https://github.com/eliasborngaesser/netcdf-leaflet-frontend/tarball/$branch | tar xz --strip=1   -C frontend