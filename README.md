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

![image](https://github.com/LarsHLunde/docker-openvpn-as/assets/5747758/a1dc1a19-3df1-4188-a5e9-2d1004153974)

## Nginx reverse proxy
```  
        location / {
                proxy_pass https://localhost:943;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
```  
