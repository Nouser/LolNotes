openssl genrsa -des3 -out server.key 1024
openssl req -new -key server.key -out server.csr
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key
openssl x509 -req -days 5000 -in server.csr -signkey server.key -out server.crt
openssl pkcs12 -export -inkey server.key -in server.crt -out server.p12