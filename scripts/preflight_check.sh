#!/bin/bash
# Step 3: Predict PCR state before applying an update
systemd-pcrlock make-policy
systemd-pcrlock predict
