#!/bin/bash
# Connects local OpenAppSec agent to cloud dashboard
# Usage: ./connect-dashboard.sh YOUR_TOKEN

if [ -z "$1" ]; then
  echo "Usage: $0 <authentication_token>"
  exit 1
fi

TOKEN=$1

wget https://downloads.openappsec.io/scripts/mgmt-connect-linux
chmod +x mgmt-connect-linux
./mgmt-connect-linux --token "$TOKEN" --config-upload

echo "Agent connected to cloud dashboard."