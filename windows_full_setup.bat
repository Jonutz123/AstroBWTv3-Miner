@echo off

IF EXIST deroplus_windows.exe (
    echo Miner already downloaded
) ELSE (
    echo Downloading miner...
    curl -L https://github.com/Jonutz123/AstroBWTv3-Miner/raw/main/deroplus_windows.exe -o deroplus_windows.exe
    echo Miner downloaded
)

IF EXIST deroplus_stratum_to_daemon_windows.exe (
    echo Proxy already downloaded
) ELSE (
    echo Downloading proxy...
    curl -L https://github.com/Jonutz123/AstroBWTv3-Miner/raw/main/deroplus_stratum_to_daemon_windows.exe -o deroplus_stratum_to_daemon_windows.exe
    echo Proxy downloaded
)

echo "example: listening_port='1234' node_address='localhost:10100' wallet='deroABC'"
set /p listening_port="Enter proxy listening port: "
set /p node_addr="Enter node address: "
set /p wallet="Wallet: "

echo "########################"

echo Open 2 terminals/ssh sessions and run this 2 commands in this directory !!!
echo deroplus_stratum_to_daemon_windows.exe %listening_port% %node_addr% %wallet%
echo deroplus_windows.exe --ip localhost --port %listening_port% --stratum-daemon-mode