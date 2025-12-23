#!/bin/bash
apt install dos2unix
chmod +x deploy-all.sh 
chmod +x cleanup-deploy-all.sh
dos2unix deploy-all.sh
dos2unix cleanup-deploy-all.sh
./deploy-all.sh 