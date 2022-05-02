#!/bin/bash

if [[ $1 == "" ]];then
  echo usage $0 kalloc.testnet
  exit 1
fi
ACCOUNT=$1

TEMPDIR=$(mktemp -d)
trap "rm -rf ${TEMPDIR}" EXIT
echo "" > ${TEMPDIR}/main.wasm
mkdir -p ${TEMPDIR}/neardev
near dev-deploy ${TEMPDIR}/main.wasm --projectKeyDirectory ${TEMPDIR}/neardev --initFunction '' 2>&1 > /dev/null 
devaccount=$(cat ${TEMPDIR}/neardev/dev-account) 
near delete ${devaccount} ${ACCOUNT} 2>&1 > /dev/null
echo 200 Ⓝ transfered to ${ACCOUNT}
