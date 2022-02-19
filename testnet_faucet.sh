#!/bin/bash

echo "" > main.wasm

logs=$(near dev-deploy ./main.wasm)
account=$(cat neardev/dev-account)
logs=$(near send $account $1 199)

rm -r neardev
rm main.wasm