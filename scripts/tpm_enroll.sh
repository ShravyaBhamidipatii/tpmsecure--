#!/bin/bash
# Step 2: Bind LUKS unlock to current TPM PCR state
DEVICE=$1
systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+1+2+3+4+5+6+7 "$DEVICE"
cryptsetup luksDump "$DEVICE"
