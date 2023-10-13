yum install nano -y
systemctl stop firewalld
systemctl disable firewalld

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 80
sudo ufw allow 443

clear
read -p " NODE ID  vmess: " node_id1
  [ -z "${node_id1}" ] && node_id1=0
  


read -p " NODE ID  trojan: " node_id2
  [ -z "${node_id2}" ] && node_id2=0



bash <(curl -Ls https://raw.githubusercontent.com/hotlanh/XrayR/master/install.sh)

cd /etc/XrayR
EOF
  cat >key.pem <<EOF
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC4GHv4uQaKLpIb
prxx8H09PTTzYzUJ/aIS/J09ahqmYtBtPW4wORyHhIpaEcbv4b84yuezO3kTGVk3
HgJE7+fk/VbqvHeReS/VIrRyvmCT3CfytsunKncouohFu8D556/97+ek3hp0/huU
LSP6iGtA4bo26e9arg2TSEe5HzR8/gVQ61kSnJsxXtmJW7DGsU7ormZlt+gzCPyC
e5MT3LaUXiD2XZFCbaf6CzYAX9HqldQJZXU8857gUCzYC+YoayLmjsXdLXU0HbB5
KERVFLjSSS0h9t9iqfnEsjqNindPpfNcvRpmFFMl4iiYzrp270mF6BL6aRkBCTqa
1sfMH+5JAgMBAAECggEAL4h23gIcG6qppAUZrAutspWuqdcoNzOrWN6r1NMkHWjv
Kv2NCVt9r8n7lQT5CjAOGSJez+rfuJw3amFPsbAF/pyhCAvwjXmubYg/8k6Qjizu
jZ9AFyICUVxUWjj/uybkzJrYgzurtiB0S36aRxJZKw/9bjdZy16cd7ZWeoiBm3Hl
BQmYU/lZMM5JdY7epu2vGAr+12eBQoL3aMwda3k2SWJ+CLB+y6s9TMwDoIsIwZs1
rEncj8Y5XsOC1jYtBit6nkY/38bk78hTOcAbzB8RHQoN1+MpSw14j2PJr+sJUEoJ
xq0AA68Y2K/ejtvOeWQqL8XCTE0WGBUl1MDicUX5PwKBgQDikXx9Ygc/dN2gUwK7
ZaLlaD3K/a90kYswGAdK3VeEAXkAb9Sfb0JDScHodesZwEavCz2maKM5Is/G5H+Q
stOCrI6eNnFqDwc7fBjrplrd+/JnOadV29AbgHnxrOgyCdWgmv1chei40+9aMIaO
X8nmYXN8eQVjhJzfnMXjB4SV3wKBgQDQApKInA0XgO+ZLQXzqkJHzJTID2lZMXXI
D/YuZQBNozbzpq7Vqvy4x+W/732K3iyxOHfug6qR2wy3GxY4e5FtJAc3vYG4H6E/
VWBKrW1Oxjlwue8DdAEYXsuyiHfUxVnN3u2UJ9FthwBhbKf6JcvLRim3CeuHPC7n
bvnEN1vw1wKBgCegFku/h1D72X8exY2M2w6QSq5j6/nRMqy4px3a1GGL+GOxK1iv
FsG59qX3aaTZUgNvTdr61gE6K2i3se/WttNV5qOZFgDcnAE1VQ5xy9ajJ+QR20hS
53TH5Yv1F68YtTofoUw7R1Z8CpKVhhMEgcU/KfmNGPosyVr6ikmImRG1AoGANG7x
kQ4FHs+ZlfsLbQiV/JNNTcDUxW76SZv8amV7Vha2W2TA3YtkeQ+qkl9EPiUTDvk1
AiKedHXLFrz1NPexCNn0F9DlSgxvEQ/sXeapjxnYkNnNrgkn3YTHxBEyY6f7ozF2
ocoHuJw3NFe3YA72+B6PlVwiyswY5q3Kt/NccbECgYEAwZ5XDdpLSg46v8JH+rAs
YONrlsWT0uUepvinpUErPNc85fTrd4X1jDWvvphboyIix8LvDWWGTnbt+puBQSFg
06lhXxp+9higzR1IkVi5IpJtxZbtQPQV4/xxC7Opro0J2xSezXfc44Q5m/3Gm5Np
ui0ijAD/KzSVdHAhTi8jDI4=
-----END PRIVATE KEY-----

EOF
  cat >crt.pem <<EOF
-----BEGIN CERTIFICATE-----
MIIEFTCCAv2gAwIBAgIUbgPtlUWzEYG2KT9d8cLNdlzCOwkwDQYJKoZIhvcNAQEL
BQAwgagxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH
Ew1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBDbG91ZGZsYXJlLCBJbmMuMRswGQYD
VQQLExJ3d3cuY2xvdWRmbGFyZS5jb20xNDAyBgNVBAMTK01hbmFnZWQgQ0EgYmIy
MjdhZTdjNzRkNDg4MzQ4NzEyYjNmM2VkZGZjNDMwHhcNMjMxMDEzMTU1MTAwWhcN
MzMxMDEwMTU1MTAwWjAiMQswCQYDVQQGEwJVUzETMBEGA1UEAxMKQ2xvdWRmbGFy
ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALgYe/i5BooukhumvHHw
fT09NPNjNQn9ohL8nT1qGqZi0G09bjA5HIeEiloRxu/hvzjK57M7eRMZWTceAkTv
5+T9Vuq8d5F5L9UitHK+YJPcJ/K2y6cqdyi6iEW7wPnnr/3v56TeGnT+G5QtI/qI
a0Dhujbp71quDZNIR7kfNHz+BVDrWRKcmzFe2YlbsMaxTuiuZmW36DMI/IJ7kxPc
tpReIPZdkUJtp/oLNgBf0eqV1AlldTzznuBQLNgL5ihrIuaOxd0tdTQdsHkoRFUU
uNJJLSH232Kp+cSyOo2Kd0+l81y9GmYUUyXiKJjOunbvSYXoEvppGQEJOprWx8wf
7kkCAwEAAaOBuzCBuDATBgNVHSUEDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAA
MB0GA1UdDgQWBBSZ1Xi73yV3nFkQMQzY53yN3jifkzAfBgNVHSMEGDAWgBRVk474
prde/xpOQ/SHSaQsa5h6sjBTBgNVHR8ETDBKMEigRqBEhkJodHRwOi8vY3JsLmNs
b3VkZmxhcmUuY29tL2JkM2FjNmUzLWY3M2EtNDAwOC1hOTUxLTg5ZjU2ZTM5NDU3
Yy5jcmwwDQYJKoZIhvcNAQELBQADggEBAJBKjQmmdOdlEQhPS2hPgC/yws93Y9xT
NIX+rbNOENxpQCbS+guuhni5/3K2mik11+AQgE5i3TFbsv7ysW6Rbh+dL0sd2Yce
TmQe5vpP5jea4h9sjb3z4mJ0IJ2YxYwtE2jK3tQ9LFW0Y4L5rVma1utCYe3nKUUv
YZb95UG2BYP8pEDsIkEMHlLrYtPNNJOnQQlg667ckL0GTV8Zdovuy5CPy2Rq8rZt
0OJ0Zjbhek2MJfxnAze61wS+NQiysqUzFypARSmamyc/D/2JNd36crdLlQUJdOaZ
rzwMbJl140zgO73mAd9X/akpQqZtZYDmHME4RiCmMLnCxQJydZRL+i4=
-----END CERTIFICATE-----


EOF

cat >config.yml <<EOF
Log:
  Level: none # Log level: none, error, warning, info, debug 
  AccessPath: # /etc/XrayR/access.Log
  ErrorPath: # /etc/XrayR/error.log
DnsConfigPath: # /etc/XrayR/dns.json # Path to dns config, check https://xtls.github.io/config/dns.html for help
RouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/routing.html for help
InboundConfigPath: # /etc/XrayR/custom_inbound.json # Path to custom inbound config, check https://xtls.github.io/config/inbound.html for help
OutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/outbound.html for help
ConnectionConfig:
  Handshake: 4 # Handshake time limit, Second
  ConnIdle: 86400 # Connection idle time limit, Second
  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second
  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second
  BufferSize: 64 # The internal cache size of each connection, kB
Nodes:
  -
    PanelType: "V2board" # Panel type: SSpanel, V2board, NewV2board, PMpanel, Proxypanel, V2RaySocks
    ApiConfig:
      ApiHost: "https://4gsieuvip.com"
      ApiKey: "khongbietdiencaigibaygio"
      NodeID: $node_id1
      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # /etc/XrayR/rulelist Path to local rulelist file
    ControllerConfig:
      DisableSniffing: True
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      AutoSpeedLimitConfig:
        Limit: 0 # Warned speed. Set to 0 to disable AutoSpeedLimit (mbps)
        WarnTimes: 0 # After (WarnTimes) consecutive warnings, the user will be limited. Set to 0 to punish overspeed user immediately.
        LimitSpeed: 0 # The speedlimit of a limited user (unit: mbps)
        LimitDuration: 0 # How many minutes will the limiting last (unit: minute)
      GlobalDeviceLimitConfig:
        Enable: false # Enable the global device limit of a user
        RedisAddr: 127.0.0.1:6379 # The redis server address
        RedisPassword: YOUR PASSWORD # Redis password
        RedisDB: 0 # Redis DB
        Timeout: 5 # Timeout for redis request
        Expiry: 60 # Expiry time (second)
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Alpn: # Alpn, Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/features/fallback.html for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: file # Option about how to get certificate: none, file, http, tls, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "vip.onevpn.id.vn" # Domain to cert
        CertFile: /etc/XrayR/crt.pem
        KeyFile: /etc/XrayR/key.pem
        Provider: cloudflare # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: 
          CLOUDFLARE_API_KEY: 
  -
    PanelType: "V2board" # Panel type: SSpanel, V2board, NewV2board, PMpanel, Proxypanel, V2RaySocks
    ApiConfig:
      ApiHost: "https://4gsieuvip.com"
      ApiKey: "khongbietdiencaigibaygio"
      NodeID: $node_id2
      NodeType: Trojan # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # /etc/XrayR/rulelist Path to local rulelist file
    ControllerConfig:
      DisableSniffing: True
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      AutoSpeedLimitConfig:
        Limit: 0 # Warned speed. Set to 0 to disable AutoSpeedLimit (mbps)
        WarnTimes: 0 # After (WarnTimes) consecutive warnings, the user will be limited. Set to 0 to punish overspeed user immediately.
        LimitSpeed: 0 # The speedlimit of a limited user (unit: mbps)
        LimitDuration: 0 # How many minutes will the limiting last (unit: minute)
      GlobalDeviceLimitConfig:
        Enable: false # Enable the global device limit of a user
        RedisAddr: 127.0.0.1:6379 # The redis server address
        RedisPassword: YOUR PASSWORD # Redis password
        RedisDB: 0 # Redis DB
        Timeout: 5 # Timeout for redis request
        Expiry: 60 # Expiry time (second)
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Alpn: # Alpn, Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/features/fallback.html for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: file # Option about how to get certificate: none, file, http, tls, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "vip.onevpn.id.vn" # Domain to cert
        CertFile: /etc/XrayR/crt.pem
        KeyFile: /etc/XrayR/key.pem
        Provider: cloudflare # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: 
          CLOUDFLARE_API_KEY: 
EOF

xrayr restart
