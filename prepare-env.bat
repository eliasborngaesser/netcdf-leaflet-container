set folder=netcdf-leaflet
set branch=develop
mkdir %folder% %folder%-tmp
curl -L https://github.com/eliasborngaesser/netcdf-leaflet-frontend/tarball/%branch% -o %folder%-tmp\frontend.tar
tar -xvf "%folder%-tmp\frontend.tar" -C "%folder%-tmp"
mkdir "%folder%\frontend"

cd "%folder%-tmp/eliasborngaesser-*"
xcopy /S "app" "..\..\%folder%\frontend\app\"
cd "../../"
rd /Q /S "%folder%-tmp"

curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/%branch%/conf/minimal-config.yml -o "%folder%\config.yml"
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/%branch%/conf/nginx/conf -o "%folder%\conf\nginx-conf"
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/%branch%/conf/netcdf.projections.properties -o "%folder%\netcdf.projections.properties"
curl -L https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/%branch%/conf/content.ftl -o "%folder%\content.ftl"
mkdir "%folder%\inputFiles"
echo Place your input .nc Files in this directory > "%folder%\inputFiles\README.txt"
pause
