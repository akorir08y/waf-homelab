# OpenAppSec Asset Configuration – General & Web Tabs

After installing the WAF agent and connecting it to the cloud dashboard, the next step is to define your digital asset – your website – and configure how the WAF protects it.

## Step 1: Define Your Digital Asset

1. In the OpenAppSec Dashboard, go to Assets Tab → New Asset.
2. This formally registers your website with the security system.

## Step 2: General Tab – The Security Blueprint

### Basic Category
- Name – A label for this asset (e.g., “Andrew’s Bakery Website”).
- Tags – Optional organisation (e.g., `production`, `ecommerce`).
- Profiles – Select the OpenAppSec agent profile you created earlier.
- Notification Triggers – Set up email/Slack alerts for specific events.

### Web Application Category
- Enter your website’s public domain: `https://yourwebsite.com`

### Source Identity
- Distinguish user – Select `Source IP` (most common).

### Trusted Sources
- Add IPs or ranges (e.g., your office network) as a “VIP list”.

## Step 3: Web Tab – Advanced Threat Prevention

- Mode – `Prevent` (live blocking) or `Learn/Detect` (tuning).
- Web Attacks – Set to “As Top Level”, confidence threshold `High and Above`.
- Advanced Options – Enable CSRF Protection, Error Disclosure, Open Redirect, block non‑valid HTTP methods.
- Intrusion Prevention – Activate signatures with severity `Medium or above`.
- File Security – Enable antivirus scanning, extract archive files up to 10 MB.

> 💡 This configures multi‑layer defense: ML‑driven web attack detection + signature‑based IPS + malware scanning for uploads.