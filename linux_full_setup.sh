#!/bin/bash
listening_port="1234"
node_addr="localhost:10100"
wallet="deroABC"

if ! [ -f deroplus_linux_amd64  ]; then
echo "Downloading miner..."
wget https://github.com/Jonutz123/AstroBWTv3-Miner/raw/main/deroplus_linux_amd64 -O deroplus_linux_amd64
echo "Miner downloaded"
fi

if ! [ -f deroplus_stratum_to_daemon_linux_amd64 ]; then
echo "Downloading app..."
wget https://github.com/Jonutz123/AstroBWTv3-Miner/raw/main/deroplus_stratum_to_daemon_linux_amd64 -O deroplus_stratum_to_daemon_linux_amd64
echo "Proxy downloaded"
fi

chmod +x deroplus_stratum_to_daemon_linux_amd64

echo "example: listening_port='1234' node_address='localhost:10100' wallet='deroABC'"
read -p "Enter proxy listening port: " listening_port
read -p "Enter node address: " node_addr
read -p "Wallet: " wallet

echo "########################"

echo "Open 2 terminals/ssh sessions and run this 2 commands in this directory !!!"
echo "./deroplus_stratum_to_daemon_linux_amd64" $listening_port $node_addr $wallet
echo "./deroplus_linux_amd64 --ip localhost --port" $listening_port "--stratum-daemon-mode"