#!/usr/bin/env bash

echo "once servers are started, open http://localhost:8081/home"

cwd=$(pwd)

cd ..

git clone https://github.com/edewit/osio-ngx-framework.git
cd osio-ngx-framework
git checkout tailor
npm install
npm start &

cd ${cwd}

cd ..

git clone https://github.com/edewit/fabric8-ui.git
cd fabric8-ui
git checkout tailor
npm install
source environments/openshift-prod-cluster.sh
npm start &

cd ${cwd}

node tailor.js &

wait