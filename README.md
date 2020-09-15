# scripts
脚本及配置文件
一、生成证书颁发机构证书
1、生成CA证书私钥
#openssl genrsa -out ca.key 4096
#openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=GuangDong/L=GuangZhou/O=SAMSUNG/OU=SPP/CN=reg.spp.com" \
 -key ca.key \
 -out ca.crt

 root@GitLab~/harbor/cert#openssl req -x509 -new -nodes -sha512 -days 3650 \
   -subj "/C=CN/ST=GuangDong/L=GuangZhou/O=SAMSUNG/OU=SPP/CN=reg.spp.com" \
   -key ca.key \
   -out ca.crt
root@GitLab~/harbor/cert#ls
ca.crt  ca.key
二、生成服务器证书
1、生成私钥
openssl genrsa -out reg.spp.com.key 4096
openssl req -sha512 -new \
    -subj "/C=CN/ST=GuangDong/L=GuangZhou/O=SAMSUNG/OU=SPP/CN=reg.spp.com" \
    -key reg.spp.com.key \
    -out reg.spp.com.csr
    --------------------------------
cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=reg.spp.com
DNS.2=pcn1harbor01

EOF

openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in reg.spp.com.csr \
    -out reg.spp.com.csr
