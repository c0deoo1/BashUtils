#!/bin/bash

SSH_USER="ssh-user"
SSH_HOST="10.66.111.1"
WORK_DIR="/home/to/ssh-user"
DATA_DIR="."
PROXY="10.66.111.1:1001"
API_ENDPOINT="http://www.test.com"

echo "Remote Get $API_ENDPOINT/apis/test"
ssh $SSH_USER@$SSH_HOST "curl -s -x $PROXY -X GET   $API_ENDPOINT/apis/test   -H 'Postman-Token: 1e1a74e1-ccfc-4176-a919-222358e3ee0d'   -H 'cache-control: no-cache'  > $WORK_DIR/test.json"
echo "Downloading test.json"
scp $SSH_USER@$SSH_HOST:$WORK_DIR/test.json  $DATA_DIR/test.json

