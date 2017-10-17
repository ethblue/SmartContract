#!/bin/bash
# brew install python3
# virtualenv ~/PyEnv3 -p=python3
# pip install solidity_flattener

timestamp() {
  date +"%s"
}
rm -rf tmp
mkdir tmp/
solidity_flattener contracts/BLUECoin.sol >> tmp/concatsrc.sol
rm -rf solcbuild

ts=$(timestamp)
FN="solcbuild$ts"

mkdir $FN

solc -o $FN --bin --ast --asm tmp/concatsrc.sol --abi --optimize
