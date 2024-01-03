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
  -p 1194:1194 \
  --device=/dev/net/tun \
  --cap-add=NET_ADMIN \
  --name openvpn-as \
  --restart unless-stopped \
  openvpn-as
docker start openvpn-as
```

Remember to fix the IP/Address in the webui:  
![image](https://github.com/LarsHLunde/docker-openvpn-as/assets/5747758/a6bd3933-e97b-4f69-8be7-7eb8de8f71eb)
