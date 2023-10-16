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



bash <(curl -Ls https://raw.githubusercontent.com/hotlanh/XrayR/master/install.sh)

cd /etc/XrayR
EOF
  cat >key.pem <<EOF
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDCOKQm6j8o89yC
ewDRky/P0pvBurvMWyA95SgzzfIW8ai3+pZOi4wGZ7qACfcE50wlBxbPm4y4Xfrh
ti10uY7pfQ9YEkIwH+LNuYkroJ3CohJ4XO46WD5zECu7Rjfl7UGKdSQfNOB9WoTU
bbZ+F4kCVU+DngXKWwJT28OEdiYuQbcxrLHjyV4jwUxPdceudAQml8cIA+JV5C4J
dylRxv7vYRTAfhhHEGTBCLBMZ5xVDyt0tbUZXPAJ910V3cWig+yD4AVgoYk5r6nm
UOKAO8HmMvN5baNP4y6BAwpHouKUHgxBFr/LDEgVllv40bjyMQvjP9lqFt4NDX2v
l/HNu6pNAgMBAAECggEARKPS88PenYENwflpsSeFArwqet2dSFw+OVG3ExPqRoyS
da70lv6/dnYLVfvvloaOBRoLyERvh6sDIukJCJMZvFAL77LIPIzQUaeMIGSLzMEN
qQci1HDiZTTmV7G5yKNAggfjQ7oiynqGrjK2B7sWm0H+L4RWBI2EdZGZ+ELvPHI0
KRuhiItgEWQarpUAkq509Ix8UUBlCOATAHaeP9a3gmFK92M9tkDt9qi0wgKXA4Sp
GFN6qtTT/PqsTkN3pBxuYiLPb43siTXNpMgJO22hDS9gi7gSmHi5wcKZWSri7sLF
/BfVANdpyDltsGHx7lcEEI+Q/xLkuDk5pD5Dy4jYiwKBgQDu7fhA38UFU5p2zQLO
VUAPRbyVZsOetgcr2Ry5urgN5fDFwN0bunUnslpY2qNp1zjO6g74DHZ3zbxxbwkt
CSX/B7smUQv9BHAxk3oB8IK6PS0Arj0temEBC6ezlt6YetLJ3O6oHErf+3yzwakh
DXLWC8DGVY1k63tKYp/Xvk9McwKBgQDQGPRvjgYH/1b+8zgTy7tkDZlFUWAdgBL9
7Xc8ubcBx+Rhq5jzNEJ1tpDnPqpT7NbE6eBI+zMAXS6v+moXlYlLIoDkDX8qKv+K
xn0VeipwCiaVuOrsaewa9jCrAnHNFY5MKz9ldZ5sT8JlYCbqVVmK0Kc6k3D0ayfo
KIusVHw+PwKBgDi9BCYLvZK9PsIVfyQWdIbr7ZOg+rVWzq8n+L1WTNzoDNw5J4it
J6MMpI3TJdk9hb0FMhbPhtZ+YdCiKJCsSnycjmHT/z/PbQEo32FUhwbI/kXaGqcR
F7YS2Xk5S5T0HdhYAcikJ1e3Ne7N/2bc9bdExTuUF2au0PFiKEkoZVZnAoGAGJrq
xAnx8p4hZjHR7p1HQfRNrCGMENDk7ftW/uoilmZRPa8xfYgvV4XHqmABebzmRBA3
QcnZ5PAfphUg2DsJKcYhoVVrNMwyvPDtN03jmK3KlCdyN5Pqo+F6La4zUIF8+sqe
S1vV6I6huKTe1RRUaxJyw31NfMjyxgONSEoRCrcCgYEAiTgGkD68gqZtCxL2JGT3
/EQi3OSfg7ApNB58Jyfqcr3M34V38bSufUplEbayO7R8DUtLJ1LnH3dMyLzgpzs7
d/BRIxRkOwSmeLYntE8yDuHURsqoixVNEngCIzE8W7fTVEhpZvTByfNapw/us6K4
1aYB5jUnQjJgUR/90a5zkOE=
-----END PRIVATE KEY-----
EOF
  cat >crt.pem <<EOF
-----BEGIN CERTIFICATE-----
MIIEpDCCA4ygAwIBAgIUXIqMoUjyuOIedcyQDteFcrEyy4AwDQYJKoZIhvcNAQEL
BQAwgYsxCzAJBgNVBAYTAlVTMRkwFwYDVQQKExBDbG91ZEZsYXJlLCBJbmMuMTQw
MgYDVQQLEytDbG91ZEZsYXJlIE9yaWdpbiBTU0wgQ2VydGlmaWNhdGUgQXV0aG9y
aXR5MRYwFAYDVQQHEw1TYW4gRnJhbmNpc2NvMRMwEQYDVQQIEwpDYWxpZm9ybmlh
MB4XDTIzMTAxMTE1MjgwMFoXDTM4MTAwNzE1MjgwMFowYjEZMBcGA1UEChMQQ2xv
dWRGbGFyZSwgSW5jLjEdMBsGA1UECxMUQ2xvdWRGbGFyZSBPcmlnaW4gQ0ExJjAk
BgNVBAMTHUNsb3VkRmxhcmUgT3JpZ2luIENlcnRpZmljYXRlMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwjikJuo/KPPcgnsA0ZMvz9Kbwbq7zFsgPeUo
M83yFvGot/qWTouMBme6gAn3BOdMJQcWz5uMuF364bYtdLmO6X0PWBJCMB/izbmJ
K6CdwqISeFzuOlg+cxAru0Y35e1BinUkHzTgfVqE1G22fheJAlVPg54FylsCU9vD
hHYmLkG3Mayx48leI8FMT3XHrnQEJpfHCAPiVeQuCXcpUcb+72EUwH4YRxBkwQiw
TGecVQ8rdLW1GVzwCfddFd3FooPsg+AFYKGJOa+p5lDigDvB5jLzeW2jT+MugQMK
R6LilB4MQRa/ywxIFZZb+NG48jEL4z/ZahbeDQ19r5fxzbuqTQIDAQABo4IBJjCC
ASIwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcD
ATAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBQkh9kqytDq1La1b1yyIgYoBJfm2TAf
BgNVHSMEGDAWgBQk6FNXXXw0QIep65TbuuEWePwppDBABggrBgEFBQcBAQQ0MDIw
MAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3NwLmNsb3VkZmxhcmUuY29tL29yaWdpbl9j
YTAnBgNVHREEIDAegg4qLm9uZXZwbi5pZC52boIMb25ldnBuLmlkLnZuMDgGA1Ud
HwQxMC8wLaAroCmGJ2h0dHA6Ly9jcmwuY2xvdWRmbGFyZS5jb20vb3JpZ2luX2Nh
LmNybDANBgkqhkiG9w0BAQsFAAOCAQEAMXh7ydVJOX9o3SOdIu2k3bax21OPP3a9
iIt+aFKnMvTHoiKc89aqMpSJ0wrZMcc3oLB/LAG6WRaB8y0bWH1nmzUsRIyQHtlF
HvuDB6CM+mb4hOfSeGAMfguwnphemoRKYw56v6Kv27PDhX6LWDdj/+u+y1f7wiZi
+1mkjUKcVbWTtOm+FVfBtDI2eKMlq3TgDMorLAqUd+DzWU3QOeYT9q1G4E5Wu9z9
s5VA4OyPGfZJUeRD0XJgWLB64qVSMX4Kl3vVX1zXQ1oP8qQv+yCwAqAjgFuFehbW
SEoX9z6BWDwQvRotlkozKZIUTWRpXYoCpm8ob04BqZIjKu0sWcpOrw==
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
      ApiHost: "https://go.vpn4g.xyz"
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

EOF

xrayr restart
