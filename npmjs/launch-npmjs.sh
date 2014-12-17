#!/bin/bash

sleep 10

if [ ! -e .configured ]; then
  cd npm-registry-couchapp
  curl -X PUT http://couchdb:5984/registry
  curl -X PUT http://couchdb:5984/_config/admins/admin -d '"npmreg"'
  npm install
  npm start --npm-registry-couchapp:couch=http://admin:npmreg@couchdb:5984/registry
  npm run load --npm-registry-couchapp:couch=http://admin:npmreg@couchdb:5984/registry
  NO_PROMPT=true npm run copy --npm-registry-couchapp:couch=http://admin:npmreg@couchdb:5984/registry
  cd ..
  touch .configured
  npm install -g kappa good@^3
fi

kappa -c ../kappa.json