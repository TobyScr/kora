# Kora Security Analaysis

## Document Purpose

This document compares security, governance, and architecture controls between:

- **Egnyte** 
- **Kora** and the tools used to build it:
  - Bubble (frontend, SaaS)
  - Xano (backend / database, SaaS)
  - n8n (self-hosted automation)
  - Enterprise LLM APIs (e.g., OpenAI)

Additional topics have been included that were raised during security discussions with Zinc's security adviser (Nick Massey). These cover areas not directly comparable to Egnyte — such as hosting location, prompt injection, and preventing client names from entering the tool — but are relevant to Kora's specific architecture and use case.

> **Note from Zinc security adviser (Nick Massey):** The outputs of Kora are potentially of a greater level of sensitivity than what is currently stored in Egnyte. The Egnyte comparison is a useful starting point, but should not be treated as the ceiling for Kora's security requirements.

---

## Encryption at Rest & In Transit

### What this means

- Data is encrypted when stored (at rest) and when moving between systems (in transit)
- If someone intercepts network traffic or gains access to storage directly, they cannot read the data
- This includes data moving between Kora's frontend, backend, and external services

---

### Egnyte — what it offers

- **At rest:** AES-256 encryption, enabled by default
- **In transit:** TLS 1.2/1.3 via HTTPS, enabled by default

---

### Kora — component by component

#### Bubble (frontend)

**Where Kora is now:**
- At rest: Encrypted by default (platform-managed)
- In transit: TLS/HTTPS enforced by default

**Gap:**
- None — at parity with Egnyte

---

#### Xano (backend)

**Where Kora is now:**
- At rest: AES-256 via Google Cloud Platform, enabled by default
- In transit: TLS 1.2+ required for all API communication

**Gap:**
- None — at parity with Egnyte

---

#### n8n (self-hosted)

**Where Kora is now:**
- At rest: Not encrypted by default — our responsibility to configure
- In transit: Not automatic — requires reverse proxy with TLS (e.g., nginx, Traefik, Caddy)

**Gap:**
- Encryption at rest requires configuration
- TLS requires reverse proxy setup

**Options to close the gap:**

Configure n8n encryption
1. Setup encryption and TLS

Difficulty — Low

---

#### Enterprise LLMs (e.g., OpenAI API, Azure OpenAI, Anthropic)

**Where Kora is now:**
- At rest: Encrypted by default on provider infrastructure (AES-256 typical)
- In transit: TLS 1.2+ enforced on all API calls

**Gap:**
- None — at parity with Egnyte (data handling/retention is a separate consideration)

---

## Customer-Controlled Encryption Keys

### What this means

- This is a layer on top of "encryption at rest"
- With customer-controlled keys, internal employees of a vendor (Egnyte, Bubble, Xano, etc.) cannot decrypt the data themselves — only the customer can (us)
- The customer holds the "master key" that allows data to be decrypted and viewed, the vendor cannot access data without the customer's explicit permission
- This provides protection against vendor insider threats and subpoenas served to the vendor

---

### Egnyte — what it offers

- Customer controlled keys available on the ultimate plan

> **Question for Zinc:** Are you on the Egnyte Ultimate plan? If not on Ultimate, this control is not currently in place for Egnyte either. Nick confirmed that Zinc does not store the most sensitive data on Egnyte.

---

### Kora — component by component

#### Bubble (frontend)

**Where Kora is now:**
- No customer-controlled key option at any tier

**Gap:**
- No path to customer-controlled encryption within Bubble's platform

**Mitigating factors:**
- Bubble has SOC2 Type II compliance to reduce this risk; employee activity logging, privileged access restrictions, MFA for employees  

**Options to close the gap:**

Data minimisation 
  - Don't store sensitive data in Bubble; delete chat messages after conversation is completed. delete uploaded attachments after transfer to backend
  - Treat Bubble as a transient presentation layer, not a data store

  Difficulty - low 

Reduce attribution
- Bubble account not named or paid for by client

  Difficulty - low 

Rebuild frontend 
- Rewrite UI in React/Next.js

  Difficulty - High

#### Xano (backend)

**Where Kora is now:**
- No customer-controlled keys on current paid (non-Enterprise) plan
- Data stored on Xano's GCP infrastructure with vendor-managed encryption

**Gap:**
- Priveleged Xano employees could technically access data if they chose to

**Mitigating factors:**
- Xano is SOC2 Type II compliant; employee activity logging, privileged access restrictions, MFA for employees  
- Xano is ISO 27001 / 27701 certified

**Options to close the gap:**

Reduce attribution
- Xano account not named or paid for by client

  Difficulty - low 

Upgrade to Xano Enterprise plan (BYOC)
- Deploy to Zinc controlled cloud hosting AWS/Azure/GCP, we control via AWS KMS
- Achieves effective parity with Egnyte Ultimate

> **Nick's recommendation:** Host on our own AWS instance (enterprise upgrade required)

Difficulty - Medium (dev ops processes and enterprise contracting)
Cost - $5k month, paid annually

---

#### n8n

**Where Kora is now:**
- Self-hosted on our infrastructure
- We control the servers, database, encryption keys, and all access
- No vendor has access to n8n data

**Gap:**
- None — self-hosting inherently provides customer-controlled keys

**Mitigations:**
- N/A — already at parity

**Options to close the gap:**
- N/A — no action required

---

#### Enterprise LLMs

**Where Kora is now:**
- No customer-controlled keys for any cloud LLM API
- All major providers retain data by default (for abuse monitoring)

**Gap:**
- Provider employees could technically access prompt/response data
- Retention windows create exposure

**Mitigating Factors**
- All LLMs have SOCII and ISO27001 compliance 

**Options to close the gap:**

Request Zero data retention from OpenAI
- This would (in theory) mean there is no data to be accessed

Difficulty - low (but unsure if OpenAI are required to approve this request)

Swap to other commercial LLMs
- Gemini/Anthropic (same process as OpenAI to request no data retention)

> **Nick's recommendation:** Do not use OpenAI, Gemini API preferred. For defense usecases use opensource LLM

Difficulty - low

Swap to opensource LLM
- Run open-source models on own infrastructure

Difficulty - High, and reduced capability vs opensource models

Reduce attribution
- API accounts not named or paid for by client

Difficulty - low

### How different is this to the status quo ###

- Any content in or attached to emails carries the same risk
- Sensitive queries typed into **Google** — search providers can see every query

---

## Access Control & Authentication

### What this means

- **Access control (RBAC):** Users only see or can act on what their role allows
- **Authentication (SSO/MFA):** How users prove who they are; when someone joins or leaves, access is granted or removed automatically
- **Device controls:** Restricting access based on the device being used (e.g., managed laptops only)

---

### Egnyte — what it offers

**Access control:**
- RBAC is a core feature — users only see what their role permits
- Four-tier permission model (Viewer, Editor, Full, Owner) at file/folder level

**Authentication:**
- SSO integration with identity providers (SAML 2.0)
- When an employee leaves, they are removed automatically
- MFA (multi factor authentication) enforced

**Device controls:**
- Native device controls on higher-tier plans
- Restrict access to managed devices only
- Remote wipe capability, mobile device managagement integration

> **Question for Zinc:** Which of the features above do you currently use?

---

### Kora — component by component

#### Platform Access (Bubble + Xano + n8n)

**Where Kora is now:**
- Only Blue Mongoose team has access to Bubble and Xano
- Client employees do not have access to either currently
- Bubble: email + password with 2FA
- Xano: email + password with 2FA
- n8n: access restricted at infrastructure level (Sliplane IP whitelisting); operators only
- MFA enforced on Xano accounts; not enforced on n8n (only available on Enterprise)

**Gap:**
- No SSO integration on current Bubble/Xano plans


**Mitigating factors:**
- Zinc employees have no platform access — only Blue Mongoose team (small team)
- 2FA available and enforced
- Sliplane provides network-level IP restriction to n8n
- Employees removed when they leave or move projects

**Options to close the gap:**

Upgrade Bubble to Enterprise
- Enables SSO integration
- Minimal data actually available on bubble - this is not a recommended investment

Difficulty — Low
Cost — Custom pricing (estimate $500-1000+/month)

Upgrade Xano to Enterprise
- Enables SSO integration

Difficulty — Low/Medium
Cost — ~$5k/month (paid annually)

Upgrade n8n to Enterprise license
- Enables SSO (SAML/OIDC/LDAP)
- Enables MFA enforcement

Difficulty — Low
Cost — ~€10,000/year (~$900/month)

---

#### Kora Application Access (end users)

**Where Kora is now:**
- Users granted access via admin panel (invite-only)
- Email invite sent → user creates password → access granted
- Users can currently view all interventions on Kora
- No SSO currently; no 2FA on user login

**Gap:**
- No domain restriction (any email can be invited)
- No 2FA on user login
- No project/intervention-level permissions — users see everything
- No automatic deprovisioning when someone leaves

**Mitigating factors:**
- Access is invite-only via admin panel (not self-signup)
- User list is controlled manually

**Options to close the gap:**

Restrict to client domain only
- Only @zincnetwork.com emails permitted for signup

Difficulty — Low

Add 2FA to user login
- Authenticator app or SMS verification

Difficulty — Low-Medium

Add project-level permissions
- Users only see interventions/projects they're assigned to

Difficulty — Medium (on roadmap)

Add SSO to Kora
- Users log in with company identity (e.g., Microsoft SSO)
- Automatic deprovisioning when someone leaves
- Confirmed in call: Zinc already uses Microsoft SSO + MFA to access Egnyte, so this would align with their existing setup

Difficulty — Medium

---

#### Device Controls

**Where Kora is now:**
- Device controls are not currently implemented on Bubble/Xano or Kora
- No mobile device managagement integration, no device entitlement checks

**Gap:**
- Cannot restrict access to managed devices only
- No remote wipe capability (not applicable — no local data)
- No device trust verification

**Mitigating factors:**
- Web app = no local data to protect/wipe
- Sliplane IP whitelisting can restrict access to approved networks

**Options to close the gap:**

IP whitelisting
- Only whitelisted IPs can access Kora
- Restricts access to office network or VPN

Difficulty — Medium

Implement SSO with conditional access
- If SSO is implemented, device controls become possible 
- Can enforce: managed device only, compliant device, location-based access

Difficulty — Medium (requires SSO first)

---

### How different is this to the status quo

- Googling the problem set can be done from any device

---

## Audit Logging & Monitoring

### What this means

- Key actions are recorded so activity can be reviewed after the fact
- Helps detect misuse, investigate incidents, and demonstrate compliance
- Nick highlighted that audit trails are particularly important for government clients
- Important distinction: logging doesn't prevent misuse — it helps you understand who did what afterwards
- Two levels matter:
  - **Platform-level:** Who on the dev/admin team accessed or changed configuration
  - **Application-level:** What end users did within the application itself

---

### Egnyte — what it offers

**Logs provided for:**
- File access
- Sharing events
- Downloads
- Permission changes

**Retention:** 3 months, then auto-purged. Must export to retain longer.

**Export:** Manual export or API access (Audit Reporting API v1/v2)

---

### Kora — component by component

#### Bubble (frontend)

**Where Kora is now:**
- Limited native audit logging on current plan
- Can track who uploaded documents and made chat messages
- Enterprise plan has more functionality (access reviews, incident investigation) but still not full granular audit logs

**Gap:**
- No admin activity logging (who changed what in the Bubble editor)
- No comprehensive user audit trail on current plan

**Mitigating factors:**
- Bubble is a presentation layer; minimal sensitive data stored

**Options to close the gap:**

Upgrade to Bubble Enterprise
- Enables access reviews and incident investigation features

Difficulty — Low
Cost — Custom pricing (estimate $500-1000+/month)

---

#### Xano (backend)

**Where Kora is now:**
- Platform-level logs and monitoring available on current plan
- Retention: 7 days on current plan

**Gap:**
- 7-day retention may be insufficient for compliance requirements
- Full logging requires enterprise plan

**Mitigating factors:**
- Can extend retention via Metadata API export to external storage
- Enterprise plan already under consideration for other features

**Options to close the gap:**

Extend log retention via export
- Use Metadata API to export logs daily to external storage

Difficulty — Low

Upgrade to Xano Enterprise
- Unlimited log retention
- Full logs

Difficulty — Medium
Cost — ~$5k/month (paid annually)

---

#### n8n (self-hosted)

**Where Kora is now:**
- All workflow executions logged; retention 7 days
- Workflow version changes stored for 1 day
- Retention limited by plan — upgrade for longer

**Gap:**
- 7-day execution log retention may be insufficient
- 1-day workflow version history is very short
- No audit trail for who changed workflows (single-operator currently)

**Mitigating factors:**
- Self-hosted = we control database and can query execution history directly
- Small operator team; changes trackable via team communication

**Options to close the gap:**

Upgrade n8n plan
- Longer retention for execution logs and workflow versions

Difficulty — Low
Cost — Plan-dependent

Manual workflow versioning
- Export workflow JSON before changes

Difficulty — Low (operational discipline required)

---

#### Kora Application (end users)

**Where Kora is now:**
- Currently no audit log UI
- However, key actions are already logged in Xano backend:
  - Creation and deletion of interventions
  - AI executions
  - n8n errors
  - Partner database changes
  - Confirmed steps (in intervention workflow)

**Gap:**
- Who viewed interventions — not currently logged (no database event)
- No user-facing audit log view

**Mitigating factors:**
- Core data changes (create/delete) already captured
- AI activity already logged

**Options to close the gap:**

Add PDF download logging
- Log when users download intervention PDFs
- Straightforward to implement

Difficulty — Low

Enforce fresh login for each intervention view
- Every view tied to authenticated user
- Clunky UX, will get annoying for user

Difficulty - Low 

Build audit log UI in Kora
- Surface existing logs to admins
- Allow filtering by user, action type, date range
- Data available in xano, this just surfaces insights 

Difficulty — Medium

---

### How different is this to the status quo

- Google searches are logged by Google but not accessible to the organisation

---

## Insider-Threat Detection

### What this means

- Identifying unusual or risky behaviour by users
- Proactive alerting when patterns suggest data exfiltration, account compromise, or policy violations
- Examples: unusual download volumes, access from new locations, bulk sharing

---

### Egnyte — what it offers

- Built-in insider-threat analytics dashboard
- Flags unusual download volumes
- Flags suspicious sharing behaviour
- Automated alerts for anomalous activity
- Does **not** provide failed login detection, credential change alerts, or device change flagging — these would come from the SSO/identity provider

---

### Kora — current situation

**Where Kora is now:**
- The platform and underlying tools do not provide built-in insider-threat analytics
- Detection features must be built by us

**Gap:**
- No automated anomaly detection
- No dashboard for security team to review suspicious patterns
- No alerting for unusual behaviour

**Mitigating factors:**
- Audit logging captures the raw data needed for detection
- Can build detection logic once logging is comprehensive

**Options to close the gap:**

Build insider-threat detection layer
- Logic built on top of audit logs
- Can match Egnyte functionality (flagging unusual downloads, sharing, access patterns)
- Requires guidance from Zinc on specific requirements and thresholds

Difficulty — Medium

> **Question for Zinc:** What specific behaviours would you want flagged? What thresholds make sense for your team size and usage patterns?

---

#### Download controls

**Where Kora is now:**
- Users can download PDFs of interventions
- No restrictions on volume or frequency

**Options to close the gap:**

Restrict download formats
- Only allow presentational formats (PDF) rather than raw data exports
- Nick recommends restricting downloads to presentational formats only, not raw data

Difficulty — Low

Block bulk downloads
- Prevent select-all / mass download
- Individual downloads only per intervention

Difficulty — Low

Flag unusual download volume/frequency
- Alert when download patterns exceed normal thresholds
- Nick flagged that quantity and frequency of downloads are the key signals to monitor

Difficulty — Medium

**Considerations:**
- Downloads can be worked around (e.g., screenshots, snipping tool)
- Nick noted that detecting screenshot/snipping activity is actually more important than download tracking — users doing this are actively trying to avoid being logged, which is inherently more suspicious
- Detection doesn't prevent exfiltration — it identifies it after the fact
- Format restrictions may help but add friction for legitimate use

---

#### Login and credential anomaly detection

Egnyte does not provide this — it would come from the identity provider. Kora can build this directly.

**Options to close the gap:**

Track failed password/MFA attempts
- Single failure is not a concern (forgot phone)
- Repeated failures are a red flag — Nick highlighted this as a key signal

Difficulty — Medium

Track credential/device/IP changes
- Flag when a known user suddenly appears from a new device or IP address
- Nick recommended monitoring for sudden device changes as an early warning sign

Difficulty — Medium

Track unauthorised access attempts
- Flag when someone without credentials attempts to log in
- Nick raised this as a concern — someone with a link to the login page trying random credentials
- Collect everything possible: device, IP, timestamp, attempted credentials

Difficulty — Low

Track permission grant attempts
- Log not just when permissions are granted, but when permission is **attempted** to be granted
- Flag attempts to give access to non-Zinc email addresses

Difficulty — Low

---

### How different is this to the status quo

- Microsoft has  some anomaly detection on higher-tier plans (is this being used by Zinc?)

---

## Backup & Disaster Recovery

### What this means

- Ability to recover data after loss — whether from accidental deletion, malicious action, or system failure
- How frequently backups are taken, how long they're retained, and how quickly you can restore
- Egnyte includes ransomware detection and recovery

---

### Egnyte — what it offers

**Ransomware protection:**
- Detects ransom notes, encrypted file extensions, attack artifacts
- Automated alerts via dashboard

**Backup & recovery:**
- Snapshots captured every 4 hours automatically
- One-click restore to pre-attack state
- Restored files keep permissions, shared links, metadata
- 30-day snapshot coverage on Platform Enterprise; 90-day on Ultimate

---

### Kora — component by component

#### Bubble (frontend)

**Where Kora is now:**
- Retention window for app versions: 6 hours (Free) to 48 hours (Starter+)
- Savepoints available for app versioning (Starter plan+)
- Database backup/restore available but disruptive process
- Blocks .exe file extension uploads (ransomware protection)

**Gap:**
- Short retention window (max 48 hours)

**Mitigating factors:**
- Bubble is presentation layer; minimal critical data stored
- Primary data lives in Xano

**Options to close the gap:**

Regular manual exports
- Export data before significant changes
- Store backups externally
- Duplicate environment

Difficulty — Low (operational discipline)

---

#### Xano (backend)

**Where Kora is now:**
- Daily automatic backups
- 3-day rolling retention (oldest deleted to make room for newest)
- Whole-instance restore only — no selective table/record restore
- Blocks .exe file extension uploads (ransomware protection)


**Gap:**
- 3-day retention is short for compliance purposes
- No selective restore (individual tables or records)

**Mitigating factors:**
- Can build custom export routines for longer retention
- Enterprise plan already under consideration for other features
- Typical ransomeware much more relevant for filestorage system than a SaaS application without file sharing

**Options to close the gap:**

Build automated backup export
- Task to export data via API to external cloud storage
- Configurable retention beyond 3 days

Difficulty — Low-Medium

Upgrade to Xano Enterprise (BYOC)
- Full database access for custom backup strategies
- Can implement point-in-time recovery

Difficulty — Medium
Cost — ~$5k/month

---

#### n8n (self-hosted)

**Where Kora is now:**
- Self-hosted = we control backup strategy
- Can export workflows and credentials via CLI or API
- Must preserve `N8N_ENCRYPTION_KEY` for credential restore

**Gap:**
- Backup strategy is our responsibility — nothing is automatic

**Mitigating factors:**
- Full control over backup frequency and retention
- Workflow templates available for automated backup to S3, GCS, Git

**Options to close the gap:**

Implement automated backup workflow
- Schedule daily/hourly exports to cloud storage

Difficulty — Low

---

## Network Security

### What this means

- Protecting the application and its infrastructure from external attacks
- Includes firewalls, DDoS protection, WAF (Web Application Firewall), intrusion detection, and vulnerability testing

---

### Egnyte — what it offers

- Network firewalls
- Intrusion detection/prevention systems
- Regular vulnerability scanning and security patching
- Penetration testing via third-party PtaaS (Pentest as a Service), integrated into development cycle

---

### Kora — component by component

#### Bubble (frontend)

**Where Kora is now:**
- Cloudflare DDoS protection + in-house DDoS monitoring
- Built on AWS infrastructure (inherits AWS network security)
- Penetration testing conducted
- Security dashboard with 20+ automated checks for app-level vulnerabilities

**Gap:**
- No dedicated firewall

**Mitigating factors:**
- Cloudflare provides WAF-like traffic filtering as part of DDoS protection
- AWS infrastructure provides baseline network security

---

#### Xano (backend)

**Where Kora is now:**
- Anti-DDoS protection included
- Firewalls and intrusion detection/prevention systems
- Regular vulnerability scanning
- Penetration testing conducted
- Rate limiting available on API endpoints (all plans)
- SAST (Static Application Security Testing) integrated into development process
- Built-in input validation per data type (protects against SQL injection, XSS)

**Gap:**
- Specific firewall only available on Enterprise plan

**Mitigating factors:**
- Built-in input validation provides application-level protection against common attack vectors
- Rate limiting prevents brute-force and abuse

**Options to close the gap:**

Upgrade to Xano Enterprise
- Enables WAF

Difficulty — Low
Cost — ~$5k/month (paid annually)

---

#### n8n (self-hosted on Sliplane)

**Where Kora is now:**
- Hosted on Hetzner infrastructure
- Automatic server updates and security patching (managed by Sliplane)
- Health checks with instant notifications

**Gap:**
- No DDoS protection
- No WAF
- No intrusion detection/prevention
- No penetration testing

**Mitigating factors:**
- n8n is not publicly exposed to end users — internal automation tool only
- Access already restricted via IP whitelisting (covered in Access Control section)

**Options to close the gap:**

Add Cloudflare in front of n8n
- Provides DDoS protection and WAF
- Free tier available

Difficulty — Low

---

# Other Areas Discussed

These sections cover security considerations that are not direct comparisons to Egnyte features, but were raised during security discussions with Zinc.

---

## Hosting Location & Data Sovereignty

### What this means

- Where data is physically stored and which legal jurisdiction it falls under
- A US-hosted service means US authorities can legally compel the company to hand over data, even if the customer is UK-based
- "UK sovereignty" means data is hosted in the UK, on infrastructure controlled by a UK entity — not just a US company with UK data centres

---

### Egnyte

- US-based company
- UK hosting available at additional cost, but Egnyte remains a US company — US authorities can legally compel data access regardless of where it's hosted
- Nick highlighted that this has become a bigger concern in the current political climate

---

### Kora — current situation

**Where Kora is now:**
- Bubble: US-hosted (AWS US infrastructure)
- Xano: US-hosted (GCP infrastructure)
- n8n: Hosted on Sliplane (Hetzner) — server location configurable (Germany, USA, Finland, Singapore)
- LLM APIs: US-based providers (OpenAI, Google, Anthropic)

**Gap:**
- No UK data sovereignty on current setup
- Multiple US-based vendors

**Mitigating factors:**
- n8n is already self-hosted — can choose server location
- Xano Enterprise (BYOC) allows hosting on UK-based AWS/GCP/Azure

**Options to close the gap:**

Host Xano on UK AWS/GCP instance (Enterprise BYOC)
- Full UK data residency for backend data
- Nick's preferred approach — AWS instance gives full control over data location

Difficulty — Medium
Cost — ~$5k/month (Xano Enterprise)

Move n8n to UK-based server
- Already possible via Sliplane (Hetzner has Germany/Finland options) or UK AWS

Difficulty — Low

Self-host LLMs
- Only necessary if classification level escalates beyond Egnyte-equivalent
- Nick's view: a commercial LLM API (e.g., Gemini) is fine for Egnyte-level security; self-hosting only required if classification increases

Difficulty — High

---

## Prompt Injection Protection

### What this means

- A prompt injection attack manipulates an LLM by inserting instructions that override the system's intended behaviour
- An attacker could craft input that says "disregard all previous instructions" followed by malicious instructions
- This could cause the LLM to retrieve private data, change its output behaviour, or send data to an external endpoint
- Nick described this as a deceptively simple attack — hidden text on websites or in documents that the LLM reads and executes as instructions, invisible to human users

### How the attack works

1. Data scraped from websites by LLMs/agents contains hidden instructions
2. The LLM reads the input as part of its prompt
3. The malicious instructions override the system prompt
4. The LLM follows the new instructions — e.g., retrieve data, change behaviour, send output elsewhere

### Why this is relevant to Kora

- Users input research content and upload documents
- This content is sent to LLM APIs as part of prompts
- If uploaded content contains hidden prompt injection, the LLM could be manipulated
- Nick raised the concern that a prompt injection could redirect LLM calls to a different model (e.g., a foreign-controlled LLM), producing skewed outputs without anyone noticing

---

### Kora — current situation

**Where Kora is now:**
- No specific prompt injection protections in place
- User input is passed to LLM APIs via n8n workflows

**Gap:**
- No input sanitisation before content reaches the LLM
- No output validation to detect anomalous LLM responses
- No monitoring for prompt injection attempts

**Options to close the gap:**

Input sanitisation
- Strip or flag known injection patterns ("ignore previous instructions", "disregard", etc.) before sending to LLM
- Apply to both typed input and uploaded document content

Difficulty — Medium

System prompt hardening
- Use robust system prompts that are more resistant to override
- Separate system instructions from user content in API calls
- Use provider-specific protections (e.g., OpenAI system message role separation)

Difficulty — Low-Medium

Output validation
- Monitor LLM responses for anomalous behaviour (unexpected format, external URLs, data leakage)
- Flag responses that deviate from expected patterns

Difficulty — Medium

Audit LLM interactions
- Already partially in place (AI executions logged in Xano)
- Extend to log full prompts and responses for review

Difficulty — Low

---

## Preventing Client Name Exposure

### What this means

- Kora is used across multiple Zinc projects and clients
- Egnyte does not have an equivalent concern — it's a file storage platform where client names are inherent to the folder structure
- For Kora, a key risk is that client names, project names, or other identifying information could be accidentally or deliberately entered into the system
- This is about preventing attribution — ensuring that if data were exposed, it could not be linked back to a specific client

---

### Kora — current situation

**Where Kora is now:**
- There is currently a field for "who is the client" — this can be removed without impacting functionality
- User-facing fields (research input, chat, document uploads) have no restrictions on what can be entered
- No filtering or flagging of sensitive terms

**Gap:**
- Users could accidentally enter client names, project codenames, or other identifying information
- No automated detection of sensitive terms
- Uploaded documents could contain client-identifying information

---

### Options to close the gap

Remove client name field from front-end
- Move to back-end only, visible to admins

Difficulty — Low

Implement two-layer user model (Nick's recommendation)
- **Admin layer (Blue Mongoose):** Can input client name in back-end only — enables search/filter functionality without exposing to other users
- **Zinc user layer:** Cannot see client name, but if they accidentally type a client name or sensitive term, the system flags it before submission
- This creates a middle filter that catches accidental exposure before it reaches end users

Difficulty — Medium

Build hot-phrase detection
- Maintain a list of client names, project codenames, and sensitive terms
- Check user inputs against this list before submission
- Flag or block matches

Difficulty — Medium

Scan uploaded documents
- Before content is processed, scan for known sensitive terms
- Flag documents that contain client-identifying information

Difficulty — Medium-High

---
