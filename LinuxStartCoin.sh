sudo apt-get update
sudo apt-get upgrade -y
mkdir ~/startcoin
cd ~/startcoin
sudo apt-get install git nano make automake build-essential libssl-dev libboost-all-dev -y
cd ~/startcoin
wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xzvf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix; ../dist/configure --enable-cxx
make
sudo make install
sudo ln -s /usr/local/BerkeleyDB.4.8/lib/libdb-4.8.so /usr/lib/libdb-4.8.so
sudo ln -s /usr/local/BerkeleyDB.4.8/lib/libdb_cxx-4.8.so /usr/lib/libdb_cxx.so
sudo ln -s /usr/local/BerkeleyDB.4.8/lib/libdb_cxx-4.8.so /usr/lib/libdb_cxx-4.8.so
sudo ln -s /usr/local/BerkeleyDB.4.8/include/db_cxx.h /usr/include/db_cxx.h 
cd ~/startcoin
git clone https://github.com/startcoin-project/startcoin.git
cd ~/startcoin/startcoin/src
export BDB_INCLUDE_PATH="/usr/local/BerkeleyDB.4.8/include"
export BDB_LIB_PATH="/usr/local/BerkeleyDB.4.8/lib"
make -f makefile.unix USE_UPNP=-
sudo cp startcoind /usr/local/bin
mkdir ~/.startcoin-v2
cd ~/.startcoin-v2
touch startcoin.conf
printf 'listen=1\n   server=1\n  daemon=1\n   testnet=0\n   rpcuser=STARTCOIN\n   rpcpassword=STARTCOIN_TEST' >> startcoin.conf
chmod 700 startcoin.conf
chmod 700 ~/.startcoin-v2
startcoind &

