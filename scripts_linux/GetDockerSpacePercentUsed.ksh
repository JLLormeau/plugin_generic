DOCKER_CMD=/usr/bin/docker
sudo -n ${DOCKER_CMD} info >/dev/null 2>&1
if [ $? -ne 0 ] ; then
        echo "`date` : `hostname` : Commande ${DOCKER_CMD} inaccessible via sudo"
        exit 1
fi
 
sudo ${DOCKER_CMD} info 2>/dev/null | grep "Data Space [UT]" |  sed -e "s/MB$/ MB/" -e "s/GB$/ GB/" | awk '{
        if ( $3 ~ /Used/ ) {
                ( $NF == "GB" ) ? Used = $4 * 1024 : Used = $4;
        }
        else {
                if ( $3 ~ /Total/ ) {
                        ( $NF == "GB" ) ? Total = $4 * 1024 : Total = $4;
                }
        }
}
END {
        printf("%.2f\n", Used / Total * 100);
}'
 
exit 0
