#!/bin/bash
# SOC Lab: SMB Brute Force Simulation
# Objective: Trigger Rule 60122 (Multiple logon failures)

TARGET_IP="192.168.1.4" # Replace with your Windows IP
USER="Administrator"

echo "Starting simulated brute force attack on $TARGET_IP..."

for i in {1..20}
do
   echo "Attempt $i..."
   smbclient -L //$TARGET_IP -U $USER%WrongPassword123
done

echo "Simulation complete. Check Wazuh Dashboard for Level 10 Alerts."
