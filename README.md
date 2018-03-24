## Miner Litecoin in Ubuntu GPU
### Run with your minergate user -> https://minergate.com/internal
##### Default is my minergate.
-----

### GPU
# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1_amd64.tar.xz
sudo tar --strip-components=1 -C /usr/bin -xvf /tmp/nvidia-docker*.tar.xz && rm /tmp/nvidia-docker*.tar.xz

# Run nvidia-docker-plugin
```
sudo -b nohup nvidia-docker-plugin > /tmp/nvidia-docker.log
```

# Test nvidia-smi
```
nvidia-docker run --rm nvidia/cuda nvidia-smi
```

### Run

##### Nicehash (cryptonight) - Default
```
nvidia-docker run -ti --rm --name Ccminer-Nicehash izone/ccminer
```
```
nvidia-docker run -ti --rm --name Ccminer-Nicehash \
-e ALGORITHM="cryptonight" \
-e POOL="cryptonight.eu.nicehash.com" \
-e PORT="3355" \
-e USER="3PThBqHfb1UVcZaZXtPAY4SC4fZNBNqCs7.1uvr3z" \
-e USERPASS="fx8350" \
izone/ccminer
```

##### SupportXMR
```
nvidia-docker run -ti --rm --name Ccminer \
-e ALGORITHM="cryptonight" \
-e POOL="pool.supportxmr.com" \
-e PORT="5555" \
-e USER="43oMPyqNyYmP5S4gatvSPKPLD2ysjpdyq63BJx2JWUjHVVCTFTn4ccy9LC1cGGUvApCdCGrECuSf9eo2WHBckfBxNx9Dqkf" \
-e USERPASS="fx8350" \
izone/ccminer
```

##### Minergate
```
nvidia-docker run -ti --rm --name Ccminer \
-e ALGORITHM="scrypt" \
-e POOL="ltc.pool.minergate.com" \
-e PORT="3336" \
-e USER="1uvr3z@gmail.com" \
-e USERPASS="fx8350" \
izone/ccminer
```

#### Build
```
docker build -t izone/ccminer .
docker build -t izone/ccminer:build -f Dockerfile_build .
```
