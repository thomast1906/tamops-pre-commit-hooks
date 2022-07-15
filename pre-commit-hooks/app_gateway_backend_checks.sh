#!/usr/bin/env bash
set -x

for lb_config in `find environments/ -name 'backend_lb_config.yaml'`
do 

    for app_configuration_number in $(yq eval '.gateways.[].app_configuration | length' $lb_config); do

        if [ "$app_configuration_number" -gt "1" ]
        then
            echo "app_configuration in $lb_config: is greater than 100, please change your product/component to use additional gateway" && exit 1
        fi

    done

done 
