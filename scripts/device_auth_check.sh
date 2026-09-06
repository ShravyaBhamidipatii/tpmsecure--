#!/bin/bash
# Step 5: Verify presented device certificate against known-good fingerprint
CERT=${1:-device_cert.pem}
openssl x509 -in "$CERT" -noout -fingerprint -sha256 > current_fingerprint.txt
if diff -q known_good_fingerprint.txt current_fingerprint.txt > /dev/null; then
  echo "Certificate valid"
  exit 0
else
  echo "Certificate mismatch -- refusing re-enrollment"
  exit 1
fi
