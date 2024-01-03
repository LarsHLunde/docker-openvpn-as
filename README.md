# docker-openvpn-as
Dockerizied OpenVPN AS install

## How to install
```
git clone https://github.com/LarsHLunde/docker-openvpn-as.git
cd docker-openvpn-as
docker build -t openvpn-as .
docker run -it \
  -p 943:943 \
  -p 443:443 \
  --device=/dev/net/tun \
  --cap-add=NET_ADMIN \
  --name openvpn-as \
  --restart unless-stopped \
  openvpn-as
docker start openvpn-as
```
