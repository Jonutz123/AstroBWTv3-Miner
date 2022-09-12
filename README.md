# deroplus - AstroBWT/v3 miner

Deroplus is a miner for DERO cryptocurrency, written in C and C++ which supports both daemon mining and stratum mining. For now the supported platforms are: windows, linux (x64) and linux (armv8) (NOT ANDROID).
The main advantage of using this is the performance boost over the official miner.

Some benchmarks examples:
````
Official miner:   AMD EPYC 7542 32-Core Processor | 128 threads | ~~ 24 - 25 KH/s  (dual cpu)
Deroplus miner:   AMD EPYC 7542 32-Core Processor | 128 threads | ~~ 49 - 50 KH/s  (dual cpu)

Official miner:   AMD Ryzen 5950x  | 32 threads | ~~ 8.5 - 9.3 KH/s
Deroplus miner:   AMD Ryzen 5950x  | 32 threads | ~~ 14 - 15.5 KH/s

Official miner:   ARM Neoverse N1  | 80 threads | ~~ 24.5 - 25 KH/s
Deroplus miner:   ARM Neoverse N1  | 80 threads | ~~ 34.5 - 35 KH/s

Official miner:   Intel(R) Core(TM) i7-6600U  | 4 threads | ~~ 600 - 650 H/s
Deroplus miner:   Intel(R) Core(TM) i7-6600U  | 4 threads | ~~ 850 - 900 H/s
````


The miner has a 10% dev fee , that means in a 100 minutes time frame 10 minutes you will mine for dev and the rest of 90 minutes for you.


## Using the miner
###### Linux amd64
This is the easiest to use version
````bash
#Download the miner
curl -L https://github.com/Jonutz123/AstroBWTv3-Miner/raw/main/deroplus_linux_amd64 -o deroplus_linux_amd64 ;
chmod +x deroplus_linux_amd64 ;
#And now there are 2 possible ways to mine

#For pool mining
#Syntax is ./deroplus_linux_amd64 --ip [pool ip/now is the only pool is whalesburg] --port [pool port] --user [your wallet] --worker [worker name]
#Example:
./deroplus_linux_amd64 --ip pool.whalesburg.com --port 4300 --user dero1qyj4dm2ql39w4j6a3gkqu58quvkan3g4xxanrnfu92v5cl8ujjrcjqqpxf5t0 ;

#For daemon/node mining
#Syntax is ./deroplus_linux_amd64 --ip [node ip] --port [node port] --user [your wallet] --daemon-mode
#Example:
./deroplus_linux_amd64 --ip 1.2.3.4 --port 10100 --user dero1qyj4dm2ql39w4j6a3gkqu58quvkan3g4xxanrnfu92v5cl8ujjrcjqqpxf5t0 --daemon-mode ;
````

###### Windows
````bash
curl -L https://github.com/Jonutz123/AstroBWTv3-Miner/raw/main/deroplus_windows.exe -o deroplus_windows.exe ;

#For pool mining is exactly the same with linux amd64

#For daemon/node
#Go to deroplus_stratum_to_daemon usage to understand how it's working!!!
#Syntax is deroplus_windows.exe --ip [stratum to daemonn ip / node ip] --port [stratum to daemonn port] --daemon-mode
#Example:
deroplus_windows.exe --ip 1.2.3.4 --port 1234 --daemon-mode ;
````

###### Linux ARM
````bash
curl -L https://github.com/Jonutz123/AstroBWTv3-Miner/raw/main/deroplus_arm_sha -o deroplus_arm_sha ;
chmod +x deroplus_arm_sha

#For pool mining is exactly the same with linux amd64

#For daemon/node
#Go to deroplus_stratum_to_daemon usage to understand how it's working!!!
#Syntax is ./deroplus_arm_sha --ip [stratum to daemonn ip / node ip] --port [stratum to daemonn port] --daemon-mode
#Example:
./deroplus_arm_sha --ip 1.2.3.4 --port 1234 --daemon-mode ;
````

###### Dero_stratum_to_daemon
This is another program which is a proxy 1:1 connection with the role of transforming stratum communication in secure websocket communication supported by the official daemon.
You need this program only if you want to mine to a node.
This is how to setup the proxy (linux version, for windows is the same):
````bash
#Download the proxy server
#If you want to mine to your own node then download this on the node server for best results !!!
curl -L https://github.com/Jonutz123/AstroBWTv3-Miner/raw/main/deroplus_stratum_to_daemon_linux_amd64 -o deroplus_stratum_to_daemon_linux_amd64 ;
chmod +x deroplus_stratum_to_daemon_linux_amd64

#Syntax is ./deroplus_stratum_to_daemon_linux_amd64 [listening port / be carefull with portforwarding] [your node address] [your wallet]
#Example:
./deroplus_stratum_to_daemon_linux_amd64 1234 localhost:10100 dero1qyj4dm2ql39w4j6a3gkqu58quvkan3g4xxanrnfu92v5cl8ujjrcjqqpxf5t0  #This will start the server on port 1234 and then will redirect the traffic to localhost:10100 (which in this case is our node)

./deroplus_stratum_to_daemon_linux_amd64 1234 1.2.3.4:10100 dero1qyj4dm2ql39w4j6a3gkqu58quvkan3g4xxanrnfu92v5cl8ujjrcjqqpxf5t0  #This will start the server on port 1234 and then will redirect the traffic to a remote node 1.2.3.4:10100
````

## WARNING
This miner is very new and it is in the first versions. You may encounter errors, do not hesitate to report the issues !!!
Also, it will be nice to report the hashrate you get with this miner.
