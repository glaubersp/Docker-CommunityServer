#!/bin/bash

set -x

docker exec -u www-data nextcloud php occ --no-warnings config:system:get trusted_domains >> trusted_domain.tmp

if ! grep -q "nextcloud" trusted_domain.tmp; then
    TRUSTED_INDEX=$(cat trusted_domain.tmp | wc -l);
    docker exec -u www-data nextcloud php occ --no-warnings config:system:set trusted_domains $TRUSTED_INDEX --value="nextcloud"
fi
if ! grep -q "nextcloud.test" trusted_domain.tmp; then
    TRUSTED_INDEX=$(cat trusted_domain.tmp | wc -l);
    docker exec -u www-data nextcloud php occ --no-warnings config:system:set trusted_domains $TRUSTED_INDEX --value="nextcloud.test"
fi

rm trusted_domain.tmp

docker cp ./onlyoffice nextcloud:/var/www/html/apps/

docker exec -u www-data nextcloud php occ --no-warnings app:enable onlyoffice

docker exec -u www-data nextcloud php occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="http://onlyoffice-document.test/"
docker exec -u www-data nextcloud php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://onlyoffice-document-server/"
docker exec -u www-data nextcloud php occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nextcloud/"
