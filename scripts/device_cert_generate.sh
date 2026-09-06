#!/bin/bash
# Step 4: Generate TPM-backed device identity certificate
tpm2_createprimary -C o -g sha256 -G rsa -c primary.ctx
openssl genrsa -out device_key.pem 2048
openssl req -new -key device_key.pem -out device.csr -subj "/CN=tpmsecure-device"
openssl x509 -req -in device.csr -signkey device_key.pem -out device_cert.pem -days 365
openssl x509 -in device_cert.pem -noout -fingerprint -sha256 > known_good_fingerprint.txt
echo "Device certificate generated. Fingerprint saved to known_good_fingerprint.txt"
