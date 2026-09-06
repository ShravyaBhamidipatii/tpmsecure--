#!/bin/bash
# Step 1: Format and open a LUKS2 encrypted volume
DEVICE=$1
cryptsetup luksFormat "$DEVICE"
cryptsetup luksOpen "$DEVICE" tpmsecure_vol
cryptsetup status tpmsecure_vol
