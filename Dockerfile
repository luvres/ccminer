FROM nvidia/cuda:9.0-base
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## References:
# https://www.youtube.com/watch?v=lJY4XymBOOI
# https://github.com/OhGodAPet/cpuminer-multi
# https://minergate.com/altminers/cpuminer-multi-wolf
# https://github.com/KlausT/ccminer-cryptonight

ENV \
	USER="43oMPyqNyYmP5S4gatvSPKPLD2ysjpdyq63BJx2JWUjHVVCTFTn4ccy9LC1cGGUvApCdCGrECuSf9eo2WHBckfBxNx9Dqkf" \
	POOL="pool.supportxmr.com" \
	PORT="5555" \
	ALGORITHM="cryptonight" 

RUN \
	apt-get update \
	&& apt-get install -y libcurl3 libjansson4 libgomp1

COPY ccminer /usr/bin

CMD ccminer -a $ALGORITHM -o stratum+tcp://$POOL:$PORT -u $USER -p x
