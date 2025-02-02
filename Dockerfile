FROM debian:12-slim
RUN apt-get update
RUN apt-get install -y ca-certificates wget net-tools gnupg
RUN wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/trusted.gpg.d/as-repository.asc
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/as-repository.asc] http://as-repository.openvpn.net/as/debian bookworm main">/etc/apt/sources.list.d/openvpn-as-repo.list
RUN apt-get update
RUN apt-get install -y openvpn-as
RUN apt-get install -y systemctl
RUN touch /firstrun
ADD init.sh /
EXPOSE 443/tcp
EXPOSE 943/tcp
EXPOSE 1194/udp
ENTRYPOINT ["/bin/bash", "/init.sh"]
