#!/bin/bash

pwd && dockerize -template nginx.conf:/etc/nginx/conf.d/nginx.conf -wait tcp://app:9000 -timeout 30s nginx -g 'daemon off;'
