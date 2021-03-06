set folder=netcdf-leaflet
set branch=master
mkdir %folder% %folder%-tmp
curl -L https://github.com/eliasborngaesser/netcdf-leaflet-frontend/tarball/%branch% -o %folder%-tmp\frontend.tar
tar -xvf "%folder%-tmp\frontend.tar" -C "%folder%-tmp"
mkdir "%folder%\frontend" "%folder%\conf" "%folder%\conf\geoserver" "%folder%\conf\nginx"

cd "%folder%-tmp/eliasborngaesser-*"
xcopy /S "app" "..\..\%folder%\frontend\app\"
cd "../../"
rd /Q /S "%folder%-tmp"

curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/%branch%/conf/minimal-config.yml -o "%folder%\config.yml"
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/%branch%/conf/nginx/conf -o "%folder%\conf\nginx\conf"
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/%branch%/conf/geoserver/netcdf.projections.properties -o "%folder%\conf\geoserver\netcdf.projections.properties"
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/%branch%/conf/geoserver/content.ftl -o "%folder%\conf\geoserver\content.ftl"
mkdir "%folder%\inputFiles"
echo Place your input .nc Files in this directory > "%folder%\inputFiles\README.txt"
pause
