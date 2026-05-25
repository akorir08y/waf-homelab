## OpenAppSec – Free, ML‑Powered WAF Installation Guide
Prerequisites

A Linux server (Ubuntu, CentOS, or similar) running a web application (e.g., NGINX, Kong, APISIX).

sudo or root access.

Outbound internet access from the server to download packages and connect to the cloud dashboard.

---
### Phase 1: Simple Model Setup (Basic WAF)

1. Log into your server and go to the /opt folder:
    
cd /opt

2. Download the installer:
    
wget https://downloads.openappsec.io/open-appsec-install
chmod +x open-appsec-install

3. Run the automatic installer:
    
./open-appsec-install --auto

4. Start the OpenAppSec engine:
    
./open-appsec-install start

Your server now has a basic, self‑learning WAF running.

---
### Phase 2: Upgrade to the Advanced ML Model

1. Log into your OpenAppSec account (web UI).

2. Go to User Menu → Download advanced ML model – save the .tgz file.

3. On your server, create a folder and copy the model file:
    
mkdir -p /advanced-model
Copy the downloaded .tgz file to /advanced-model/
(Use scp, rsync, or mv if already on server)

4. Stop the agent, unpack the model, and restart:
    
open-appsec-ctl --stop-agent
tar -xzf /advanced-model/open-appsec-advanced-model.tgz -C /etc/cp/conf/waap
open-appsec-ctl --start-agent

Your WAF now uses machine learning to detect sophisticated attacks.

---
### Phase 3: Connect to the Cloud Dashboard

1. In the OpenAppSec web UI:

2. Go to Getting Started > Linux Embedded Agent

3. Give your agent a name (e.g., my-website-waf)

4. Set upgrade policy to Automatic

5. Click Generate Authentication Token – copy the token.

6. On your server, download the connection script and run it:
    
wget https://downloads.openappsec.io/scripts/mgmt-connect-linux
chmod +x mgmt-connect-linux
./mgmt-connect-linux --token YOUR_COPIED_TOKEN --config-upload

Verify – you can now see security events in the cloud console.

---
### Phase 4: Basic Security Configuration (via Cloud UI)

After connecting, configure your Web Application Security settings:

Section	Recommended Setting

Protection Mode	Learn / Detect      (beginner) or Prevent (advanced)
Intrusion Prevention	            Top Level – block when confidence is High
File Security	                    Enable – block archive, executable, and script files (.asp, .php, .exe, etc.)
Bot Protection	                    Inject on /login, /register – validate on POST
Rate Limiting	                    Drop requests that match suspicious file types
API Protection	                    Enforce schema validation; return 400 / 422 errors

For a production environment, also set up custom 403 responses for sensitive directories (/admin, etc.).

Monitoring & Maintenance

1. Local logs:

open-appsec-ctl --view-logs

2. Cloud console: view attack patterns, traffic analytics, and fine‑tune policies.

Regular updates: The agent can auto‑update (set in policy) – always keep signatures and the ML model current.

Need Help?

OpenAppSec official docs: https://www.openappsec.io/docs

Community support: GitHub issues / Discord.