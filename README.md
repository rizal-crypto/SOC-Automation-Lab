# SOC-Automation-Lab
A professional-grade security monitoring environment. Features a centralized Wazuh manager collecting telemetry from Windows endpoints via Sysmon and real-time FIM. Includes simulated MITRE ATT&amp;CK brute-force scenarios and automated account lockout responses

I designed and deployed a comprehensive Security Operations Center (SOC) environment to simulate enterprise-grade monitoring and incident response. The project focuses on the integration of Wazuh SIEM with advanced endpoint telemetry and mapping security events to the MITRE ATT&CK framework.

Technical Architecture
SIEM Platform: Wazuh (Manager deployed on Ubuntu 22.04).

Endpoint Monitoring: Windows 11 Enterprise utilizing Wazuh Agent & Microsoft Sysmon.

Telemetry Sources: Windows EventLogs, Sysmon EventChannel, and Real-time File Integrity Monitoring (FIM).

Communication: Encrypted agent-manager tunnel (Ports 1514/1515).

Key Phases & Deliverables
1. Vulnerability Management & Patching
Conducted automated scans of the endpoint against the National Vulnerability Database (NVD).

Findings: Identified 7 high-severity vulnerabilities in Microsoft Teams (CVE-2025-53783).

Action: Mapped vulnerabilities to internal risk scores to prioritize remediation.

2. Advanced Telemetry (Sysmon Integration)
To bypass the limitations of standard Windows logs, I integrated Sysmon to gain deep visibility into process creation (Event ID 1) and network connections.

Proof of Concept: Captured unauthorized process execution through the SIEM dashboard, enabling granular forensic investigation.

3. File Integrity Monitoring (FIM)
Configured real-time monitoring of sensitive system directories.

Detection: Triggered Level 7 alerts upon unauthorized modification of protected files.

Impact: Ensures data integrity and detects potential ransomware or persistent backdoors.

4. Incident Simulation: Brute Force & Account Lockout
Simulated a Credential Access (T1110) attack via SMB using a scripted bash loop from the Ubuntu manager.

Detection: Correlated 20+ failed login attempts into a High-Severity (Level 10) Alert.

Mitigation: The attack successfully triggered a local Windows security policy, resulting in an Account Lockout, verified by Rule 60115 in the SIEM.
## Deployment
1. Update `ossec.conf` with your Wazuh manager IP.
2. Run `deploy-agent.ps1` as Administrator.
3. Verify agent is running with `Get-Service WazuhSvc`.
