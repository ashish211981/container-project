#!/bin/bash

# Copyright 2015 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "$(hostname -i) spark-master" >> /etc/hosts
export SPARK_LOCAL_HOSTNAME=$(hostname -i)
export SPARK_MASTER_IP=$1
export MASTER=spark://$1:7077

/opt/spark/sbin/start-master.sh
tail -F /opt/spark/logs/*
