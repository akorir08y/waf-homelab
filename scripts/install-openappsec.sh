#!/bin/bash
# OpenAppSec automated installer – Simple Model

set -e

cd /opt
wget https://downloads.openappsec.io/open-appsec-install
chmod +x open-appsec-install
./open-appsec-install --auto
./open-appsec-install start

echo "OpenAppSec basic WAF installed and started."