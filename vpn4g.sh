#!/bin/bash
clear
echo ""
echo "   1. Cài đặt"
echo "   2. update config"
echo "   3. thêm node"
read -p "   Lựa chọn của bạn là (mặc định Cài đặt): " num
[ -z "${num}" ] && num="1"
    
pre_install(){
 clear
    read -p "  Nhập số Node cần cài (mặc định 1): " n
     [ -z "${n}" ] && n="1"
    a=0
  while [ $a -lt $n ]
 do
 
  echo -e "  [1] V2ray"
  echo -e "  [2] Trojan"
   read -p "  Nhập loại Node: " NodeType
  if [ "$NodeType" == "1" ]; then
    NodeType="V2ray"
  elif [ "$NodeType" == "2" ]; then
    NodeType="Trojan"
  else 
   NodeType="V2ray"
  fi
  echo "-------------------------------"
  echo -e "  Loại Node là ${NodeType}"
  echo "-------------------------------"


  #node id
    read -p "  Nhập ID Node: " node_id
  [ -z "${node_id}" ] && node_id=0
  echo "-------------------------------"
  echo -e "  ID Node là ${node_id}"
  echo "-------------------------------"
  



 config
  a=$((a+1))
done
}


#clone node
clone_node(){
  clear
    read -p "  Nhập số Node cần cài thêm (mặc định 1): " n
     [ -z "${n}" ] && n="1"
    a=0
  while [ $a -lt $n ]
  do
  echo -e "  [1] V2ray"
  echo -e "  [2] Trojan"
   read -p "  Nhập loại Node: " NodeType
  if [ "$NodeType" == "1" ]; then
    NodeType="V2ray"
  elif [ "$NodeType" == "2" ]; then
    NodeType="Trojan"
  else 
   NodeType="V2ray"
  fi
  echo "-------------------------------"
  echo -e "  Loại Node là ${NodeType}"
  echo "-------------------------------"

  #node id
    read -p "  Nhập ID Node: " node_id
  [ -z "${node_id}" ] && node_id=0
  echo "-------------------------------"
  echo -e "  ID Node là ${node_id}"
  echo "-------------------------------"
  

  #giới hạn thiết bị
read -p "  Nhập giới hạn thiết bị: " DeviceLimit
  [ -z "${DeviceLimit}" ] && DeviceLimit="0"
  echo "-------------------------------"
  echo "  Thiết bị tối đa là ${DeviceLimit}"
  echo "-------------------------------"
  
  #IP vps
 read -p "  Nhập địa chỉ Node: " CertDomain
  [ -z "${CertDomain}" ] && CertDomain="0"
 echo "-------------------------------"
  echo "  Địa chỉ Node là ${CertDomain}"
 echo "-------------------------------"

 config
  a=$((a+1))
  done
}







config(){
cd /etc/XrayR
cat >>config.yml<<EOF
  -
    PanelType: "V2board" # Panel type: SSpanel, V2board, PMpanel, Proxypanel, V2RaySocks
    ApiConfig:
      ApiHost: "https://go.vpn4g.xyz"
      ApiKey: "khongbietdiencaigibaygio"
      NodeID: $node_id
      NodeType: $NodeType # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # /etc/XrayR/rulelist Path to local rulelist file
    ControllerConfig:
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      DisableUploadTraffic: false # Disable Upload Traffic to the panel
      DisableGetRule: false # Disable Get Rule from the panel
      DisableIVCheck: false # Disable the anti-reply protection for Shadowsocks
      DisableSniffing: True # Disable domain sniffing
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      AutoSpeedLimitConfig:
        Limit: 0 # Warned speed. Set to 0 to disable AutoSpeedLimit (mbps)
        WarnTimes: 0 # After (WarnTimes) consecutive warnings, the user will be limited. Set to 0 to punish overspeed user immediately.
        LimitSpeed: 0 # The speedlimit of a limited user (unit: mbps)
        LimitDuration: 0 # How many minutes will the limiting last (unit: minute)
      GlobalDeviceLimitConfig:
        Limit: 0 # The global device limit of a user, 0 means disable
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
        CertMode: file # Option about how to get certificate: none, file, http, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "vippp.onevpn.id.vn" # Domain to cert
        CertFile: /etc/XrayR/443.crt # Provided if the CertMode is file
        KeyFile: /etc/XrayR/443.key
        Provider: alidns # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          ALICLOUD_ACCESS_KEY: aaa
          ALICLOUD_SECRET_KEY: bbb
EOF

#   sed -i "s|ApiHost: \"https://domain.com\"|ApiHost: \"${api_host}\"|" ./config.yml
 # sed -i "s|ApiKey:.*|ApiKey: \"${ApiKey}\"|" 
#   sed -i "s|NodeID: 41|NodeID: ${node_id}|" ./config.yml
#   sed -i "s|DeviceLimit: 0|DeviceLimit: ${DeviceLimit}|" ./config.yml
#   sed -i "s|SpeedLimit: 0|SpeedLimit: ${SpeedLimit}|" ./config.yml
#   sed -i "s|CertDomain:\"node1.test.com\"|CertDomain: \"${CertDomain}\"|" ./config.yml
 }

case "${num}" in
  1) bash <(curl -Ls https://raw.githubusercontent.com/hotlanh/XrayR/master/install.sh)
EOF
  cat >key.pem <<EOF
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC3J97exrCFbw1x
QxubqZKl00FisBLuBTaKmkEmTwIR7xmPQNltpk4gijfHwJOvmRQad8wVA0iqXHUU
xB6omEqLTfPdGt2mB6+y8VluSNboDTFIvmLJZZ6uVa++0mOMU+xbGMJc3owSFL4v
Nost3jrIvBo7lcRvRD0utihsiuJ/YcULOnMHveaonaXVNLyZ0Q56uBXuTH6CV6qx
jLV8tVfnjR6janrM4/1s8YdAZaQbValECOF3g0qPCdGnODSII3oZcy/LZMXILpBt
4RPVZF7JkyvEiT27p207yIeVvOs1/LEuWCVn2OEQ6bs94ytMhCey1hRJDYOwew7r
BK/h36u5AgMBAAECggEAE4sreNPUgO5+TZZKtz/fVDbAQMC3SmLvxJcsacMvPjzo
Wi0CLnU7G7WH+XaDA88msiLTme/nZHdYbnJ1b4nNlYMISTD9UwK5tLNUdsRKu0jy
F/gpyCIB7koaJldilDYdz8Qq9Dgyk9jXCOht7kNq/CG3PmGvK+zJBwectWVWAR++
TXU1PhT2J7T0cj7Iy+CQQCFwVflZW3wwsp48itAIatPOrSzHRxvkkOcvrrgZrECP
eKUTDov8kGKyaLfTXdMyFOU+AgrOcMDnbtMOtqjiraWB3LqkCzcYtWCr8DQ6V+gd
ojdc7pwK7v3jyXw/UtGD0cfL+gPs+buj0mqDF73uEQKBgQDaPdLrQ6/WY2FAYL4z
Aumxft1lKkCqsI3yxUMl5E3fPLj38UIxdLQuJl99hFSpE0aIwBWEgT7Ta5CsKGRO
jWieTO6Rr489EuyfQq5OLxWaf2aHhsV9DNovll4xp/IB4PwfablV+76nIoUsWnD3
Qj8SV/+QlKqlitAU+zQXrRetaQKBgQDW2A6I98TlIIdGkuhIwtLzLm347T204hcZ
if1iXXfXFTXwQJNRrm1w4cDu+5CxqEpLb0U25R/byBGa/WvTNm4BOy8cYnc4Zf1w
MUxi/nM3ID0IPnXIXdIwrvqW1pwHhgxn5TXPbYfzZY0926bsxuCDaKAiSkUBcKPg
hk4AgUox0QKBgQCc6ysGwipiSh6Y/XaEkymY2BE0Nkc886l8z11Sl29ufei5Th08
Fh+ftzOdulJtJ1Dl7scJ+SxFM+hYAMruuDpq6AH5enPRhBPjBzzxNmWgKs57z+mb
2mvfH40mwwz9UNm3dHswWcxhvC5pD7Z98oILHH7DZEG2ubKYA28XPvvxUQKBgQC5
7vZ1V2kRmxs32sAo6GNEjrQiML+soda4BZJC5P1oKTUrHdfhYwHYJaihqxnIhwr1
SfEu1xDBVt7Vsej1PC/r5NqayCTBrJKv3BptuiTgWog3cEbjBz93XpgEnuseH8bw
y4/MWtDDtumL1WMbm+qGD7A2vOwHmQJauCEdkscxYQKBgGHkNh33OKxUS4AHvk4z
R4Y5Z/6QE4C83lVkPJhOTNs421SaYhW2XFNNxJXnyMghZwS6u9D/dBgQQzIVQwkI
x+32aKdCtJjBC//SMb5J0O5myXnprR3FwoN0jWX/vy4eq1xxQp+c9C+7Isgc76D5
dpLMANWHcq9egf0jXC/0VSNa
EOF
  cat >crt.pem <<EOF
MIIEpDCCA4ygAwIBAgIUKV0nW78vR5888JxWGAAgkCdu+JIwDQYJKoZIhvcNAQEL
BQAwgYsxCzAJBgNVBAYTAlVTMRkwFwYDVQQKExBDbG91ZEZsYXJlLCBJbmMuMTQw
MgYDVQQLEytDbG91ZEZsYXJlIE9yaWdpbiBTU0wgQ2VydGlmaWNhdGUgQXV0aG9y
aXR5MRYwFAYDVQQHEw1TYW4gRnJhbmNpc2NvMRMwEQYDVQQIEwpDYWxpZm9ybmlh
MB4XDTIzMTAwMzE2MzYwMFoXDTM4MDkyOTE2MzYwMFowYjEZMBcGA1UEChMQQ2xv
dWRGbGFyZSwgSW5jLjEdMBsGA1UECxMUQ2xvdWRGbGFyZSBPcmlnaW4gQ0ExJjAk
BgNVBAMTHUNsb3VkRmxhcmUgT3JpZ2luIENlcnRpZmljYXRlMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtyfe3sawhW8NcUMbm6mSpdNBYrAS7gU2ippB
Jk8CEe8Zj0DZbaZOIIo3x8CTr5kUGnfMFQNIqlx1FMQeqJhKi03z3RrdpgevsvFZ
bkjW6A0xSL5iyWWerlWvvtJjjFPsWxjCXN6MEhS+LzaLLd46yLwaO5XEb0Q9LrYo
bIrif2HFCzpzB73mqJ2l1TS8mdEOergV7kx+gleqsYy1fLVX540eo2p6zOP9bPGH
QGWkG1WpRAjhd4NKjwnRpzg0iCN6GXMvy2TFyC6QbeET1WReyZMrxIk9u6dtO8iH
lbzrNfyxLlglZ9jhEOm7PeMrTIQnstYUSQ2DsHsO6wSv4d+ruQIDAQABo4IBJjCC
ASIwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcD
ATAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBQ5Zlf4eQS5zoOxUEzY3cJxxDIB8zAf
BgNVHSMEGDAWgBQk6FNXXXw0QIep65TbuuEWePwppDBABggrBgEFBQcBAQQ0MDIw
MAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3NwLmNsb3VkZmxhcmUuY29tL29yaWdpbl9j
YTAnBgNVHREEIDAegg4qLm9uZXZwbi5pZC52boIMb25ldnBuLmlkLnZuMDgGA1Ud
HwQxMC8wLaAroCmGJ2h0dHA6Ly9jcmwuY2xvdWRmbGFyZS5jb20vb3JpZ2luX2Nh
LmNybDANBgkqhkiG9w0BAQsFAAOCAQEAdJSSlo5jEaG+/CPQvRFxMo7YwYnstIct
g1AiSAW/LW8AfdNnLKodM25EyIhSDlCxeJynmvJoAOgGWQgS4LQ/TFEt0Zci/Qqk
SCpJs+52MyW9ua8MnmVrrQTXaUef/DGtAA/woiJ/mM0lDVtWFduYcC4qoWTNJWyu
w+4btHWoMFsXlFttevaJ1+ACT9fLrRX6Eb0vbZtr5fie1Hlwvn9F2jFyQMaSWbwD
L9f+LbPIdXtG28a9N1lBLQTvE2Lx2ydm7CNhMiV++9mE7Hy3u23AxuJtlJNXcbkz
N5HYb4c6dcSWA7yBHEFwpz7sEruJgmb0EqZ5mCpOQT3jhgz6Q+A6pQ==
EOF
cd /etc/XrayR
  cat >config.yml <<EOF
Log:
  Level: none # Log level: none, error, warning, info, debug 
  AccessPath: # /etc/XrayR/access.Log
  ErrorPath: # /etc/XrayR/error.log
DnsConfigPath: # /etc/XrayR/dns.json # Path to dns config, check https://xtls.github.io/config/dns.html for help
RouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/routing.html for help
OutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/outbound.html for help
ConnectionConfig:
  Handshake: 4 # Handshake time limit, Second
  ConnIdle: 30 # Connection idle time limit, Second
  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second
  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second
  BufferSize: 64 # The internal cache size of each connection, kB  
Nodes:
EOF
pre_install
cd /root
xrayr start
 ;;
 2) cd /etc/XrayR
cat >config.yml <<EOF
Log:
  Level: none # Log level: none, error, warning, info, debug 
  AccessPath: # /etc/XrayR/access.Log
  ErrorPath: # /etc/XrayR/error.log
DnsConfigPath: # /etc/XrayR/dns.json # Path to dns config, check https://xtls.github.io/config/dns.html for help
RouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/routing.html for help
OutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/outbound.html for help
ConnectionConfig:
  Handshake: 4 # Handshake time limit, Second
  ConnIdle: 30 # Connection idle time limit, Second
  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second
  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second
  BufferSize: 64 # The internal cache size of each connection, kB 
Nodes:
EOF
pre_install
cd /root
xrayr restart
 ;;
 3) cd /etc/XrayR
 clone_node
 cd /root
  xrayr restart
;;
esac
