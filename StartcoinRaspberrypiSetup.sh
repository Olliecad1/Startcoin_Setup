sed '16d' /etc/dphys-swapfile
sed 's/16d/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
mkdir ~/startcoin
cd ~/startcoin
sudo apt-get install git nano make automake build-essential libssl-dev libboost-all-dev -y
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
cd ~/startcoin/startcoin/src/
mkdir obj
export BDB_INCLUDE_PATH="/usr/local/BerkeleyDB.4.8/include"
export BDB_LIB_PATH="/usr/local/BerkeleyDB.4.8/lib"
make -f makefile.unix USE_UPNP=-
sudo cp startcoind /usr/local/bin
cd ~/.startcoin-v2
touch startcoin.conf
printf 'listen=1\n   server=1\n  daemon=1\n   testnet=0\n   rpcuser=STARTCOIN\n   rpcpassword=STARTCOIN_TEST' >> startcoin.conf
chmod 700 startcoin.conf
chmod 700 ~/.startcoin-v2
sudo apt-get install qt4-qmake libqt4-dev build-essential libboost-dev libboost-system-dev \
    libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev \
    libssl-dev libdb++-dev libminiupnpc-dev
sudo apt-get install qt5-qmake libqt5gui5 libqt5dbus5 qttools5-dev-tools
qmake
make
cd ~/startcoin
sudo cp startcoin-qt /usr/local/bin
startcoin-qt

