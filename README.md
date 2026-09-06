# TPMSecure

TPM-backed predictive re-enrollment with device authentication for LUKS-encrypted Linux systems.

## Overview
Prevents accidental lockouts caused by security updates that alter TPM PCR measurements, by predicting mismatches before they happen, and adding a device identity certificate check as a fourth gate before automatic re-enrollment.

## Scripts
- `scripts/luks_setup.sh <device>` — Format and open a LUKS2 volume
- `scripts/tpm_enroll.sh <device>` — Bind unlock to current TPM PCR state
- `scripts/preflight_check.sh` — Predict PCR state before an update
- `scripts/device_cert_generate.sh` — Generate TPM-backed device identity certificate
- `scripts/device_auth_check.sh <cert>` — Verify certificate fingerprint before re-enrollment

## Interactive demo
See `demo/index.html` for an interactive walkthrough of the four-gate pipeline and the three test scenarios. Open it directly in a browser, or view it live via GitHub Pages once pushed.

## Requirements
tpm2-tools, cryptsetup, systemd (255+), openssl

## Known limitation
`systemd-pcrlock` policy-based TPM sealing showed instability under the `swtpm` software TPM emulator used for development (OR-policy session errors). Direct PCR-list enrollment (`--tpm2-pcrs=`) was used for the disk seal instead, while `systemd-pcrlock predict` is still used for the pre-flight prediction step.
