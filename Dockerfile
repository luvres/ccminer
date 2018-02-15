FROM nvidia/cuda:9.0-base
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## References:
# https://www.youtube.com/watch?v=lJY4XymBOOI
# https://github.com/OhGodAPet/cpuminer-multi
# https://minergate.com/altminers/cpuminer-multi-wolf
# https://github.com/KlausT/ccminer-cryptonight

ENV USER="1uvr3z@gmail.com" \
        COIN=ltc \
        PORT=3336

RUN \
	apt-get update \
	&& apt-get install -y libcurl3 libjansson4 libgomp1

COPY ccminer /usr/bin

CMD ccminer -a scrypt -o stratum+tcp://$COIN.pool.minergate.com:$PORT -u $USER -p x
