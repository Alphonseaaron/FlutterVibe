#!/bin/bash

REQUEST_ID=$1

if [ -z "$REQUEST_ID" ]; then
  echo "Usage: ./tools/update_firestore.sh <request_id>"
  exit 1
fi

PREVIEW_URL="http://localhost:8080"

firebase firestore:set "buildRequests/$REQUEST_ID" "{'previewUrl': '$PREVIEW_URL'}" --merge
