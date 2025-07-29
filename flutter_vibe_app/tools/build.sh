#!/bin/bash

REQUEST_ID=$1

if [ -z "$REQUEST_ID" ]; then
  echo "Usage: ./tools/build.sh <request_id>"
  exit 1
fi

flutter build web --release

./tools/update_firestore.sh "$REQUEST_ID"
