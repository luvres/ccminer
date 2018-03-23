FROM nvidia/cuda:9.0-base
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## References:
# https://www.youtube.com/watch?v=lJY4XymBOOI
# https://github.com/OhGodAPet/cpuminer-multi
# https://minergate.com/altminers/cpuminer-multi-wolf
# https://github.com/KlausT/ccminer-cryptonight

ENV \
	USER="3PThBqHfb1UVcZaZXtPAY4SC4fZNBNqCs7.1uvr3z" \
	POOL="cryptonight.eu.nicehash.com" \
	PORT="3355" \
	ALGORITHM="cryptonight" 

RUN \
	apt-get update \
	&& apt-get install -y libcurl3 libjansson4 libgomp1

COPY ccminer /usr/bin

CMD ccminer -a $ALGORITHM -o stratum+tcp://$POOL:$PORT -u $USER -p x
