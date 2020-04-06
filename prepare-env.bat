set folder=netcdf-leaflet
mkdir %folder% %folder%-tmp
curl -L https://github.com/eliasborngaesser/netcdf-leaflet-frontend/tarball/master -o %folder%-tmp\frontend.tar
tar -xvf "%folder%-tmp\frontend.tar" -C "%folder%-tmp"
mkdir "%folder%\frontend"

cd "%folder%-tmp/eliasborngaesser-*"
xcopy /S "app" "..\..\%folder%\frontend\app\"
cd "../../"
rd /Q /S "%folder%-tmp"

curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/minimal-config.yml -o "%folder%\config.yml"
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/master/nginx/conf -o "%folder%\nginx-conf"
mkdir "%folder%\inputFiles"
echo Place your input .nc Files in this directory > "%folder%\inputFiles\README.txt"
pause
