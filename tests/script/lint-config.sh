#!/bin/sh

# MIT License
#
# Copyright (c) 2023-2024 Kazuhito Suda
#
# This file is part of FIWARE Small Bang
#
# https://github.com/lets-fiware/FIWARE-Small-Bang
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -ue

cd "$(dirname "$0")"
cd ../..

echo "*** diff config.sh .config.sh ***"
diff config.sh .config.sh

. ./config.sh

for NAME in CYGNUS_MONGO CYGNUS_MYSQL CYGNUS_POSTGRES CYGNUS_ELASTICSEARCH ELASTICSEARCH_PASSWORD MYSQL_ROOT_PASSWORD POSTGRES_PASSWORD COMET QUANTUMLEAP PERSEO WIRECLOUD IOTAGENT_UL IOTAGENT_JSON IOTAGENT_HTTP IOTAGENT_MQTT NODE_RED START_CONTAINER
do
  eval VAL=\"\$$NAME\"
  if [ -n "$VAL" ]; then
    echo "${NAME} not empty: ${VAL}"
    exit 1
  fi
done
