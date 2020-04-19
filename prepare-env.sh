folder=netcdf-leaflet
branch=develop
mkdir $folder
mkdir $folder/inputFiles
echo "Place yout input .nc Files in this Folder" > $folder/inputFiles/README.txt
./utils/dl-frontend.sh $branch
mv frontend $folder
curl -L  -o "$folder/config.yml" "https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/$branch/conf/minimal-config.yml"
curl -L  -o "$folder/conf/nginx/conf" "https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/$branch/conf/nginx/conf"
curl -L  -o "$folder/conf/netcdf.projections.properties" "https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/$branch/conf/netcdf.projections.properties"
curl -L  -o "$folder/conf/content.ftl" "https://raw.githubusercontent.com/eliasborngaesser/netcdf-leaflet-container/$branch/conf/content.ftl"