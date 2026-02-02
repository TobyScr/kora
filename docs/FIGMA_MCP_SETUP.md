# Figma MCP Setup for Claude Code in WSL

This guide explains how to connect Claude Code (running in WSL) to Figma Desktop (running on Windows).

## The Solution

WSL2 can reach Windows directly via the vEthernet IP address. No SSH tunnel required.

---

## One-Time Setup

### 1. Find Your Windows WSL IP Address

**In PowerShell:**

```powershell
ipconfig
```

Look for **"Ethernet adapter vEthernet (WSL)"** (may also appear as **"vEthernet (WSL (Hyper-V firewall))"**) and note the **IPv4 Address** (usually starts with `172.x.x.x`).

Example: `172.21.112.1`

### 2. Enable Figma Desktop MCP Server

1. Open **Figma Desktop** on Windows
2. Open or create a Figma Design file
3. Toggle to **Dev Mode** (keyboard shortcut: `Shift+D`)
4. In the inspect panel, click **"Enable desktop MCP server"**
5. You'll see a confirmation when the server is running

### 3. Update the Figma Plugin's MCP Config (Required for WSL)

The Figma plugin for Claude Code ships with a hardcoded `127.0.0.1` URL for the desktop server. This doesn't work from WSL since `127.0.0.1` refers to the WSL VM, not Windows. You must update the plugin config to use the vEthernet IP.

**In WSL terminal, edit the plugin config:**

```bash
nano ~/.claude/plugins/cache/claude-plugins-official/figma/1.0.0/.mcp.json
```

Change the `figma-desktop` URL from `127.0.0.1` to your vEthernet IP:

```json
{
  "mcpServers": {
    "figma": {
      "type": "http",
      "url": "https://mcp.figma.com/mcp"
    },
    "figma-desktop": {
      "type": "http",
      "url": "http://172.21.112.1:3845/mcp"
    }
  }
}
```

> **Note:** You do NOT need to run `claude mcp add` separately. The plugin config handles the `figma-desktop` server. Adding it manually creates a duplicate entry.

**Verify it worked (after restarting Claude Code):**

```bash
claude mcp list
```

You should see `plugin:figma:figma-desktop` listed as Connected.

---

## Daily Usage

1. **Open Figma Desktop** on Windows (must be running with Dev Mode enabled)
2. **Start Claude Code** in WSL - that's it!

No tunnel or extra terminal needed.

---

## Troubleshooting

### "Failed to connect" when starting Claude Code

**Check Figma is listening:**

```powershell
# In PowerShell
netstat -an | findstr 3845
```

Should show:
```
TCP    127.0.0.1:3845         0.0.0.0:0    LISTENING
TCP    172.21.112.1:3845      0.0.0.0:0    LISTENING
```

If not, restart Figma Desktop and enable Dev Mode MCP server.

### Wrong IP address after Windows restart

Windows may reassign the WSL vEthernet IP. To fix:

1. Find the new IP:
   ```powershell
   ipconfig
   ```
   Look for `vEthernet (WSL)` or `vEthernet (WSL (Hyper-V firewall))` IPv4 Address.

2. Update the plugin config:
   ```bash
   nano ~/.claude/plugins/cache/claude-plugins-official/figma/1.0.0/.mcp.json
   ```
   Replace the old IP with the new one in the `figma-desktop` URL.

### Plugin config resets after Figma plugin update

If the Figma plugin is updated or reinstalled, the `.mcp.json` file may be overwritten and reset `figma-desktop` back to `127.0.0.1`. If desktop MCP stops connecting after a plugin update, re-apply the IP fix from Step 3 above.

### MCP shows connected but no tools available

Restart Claude Code. Tools are loaded at session start.

### Figma MCP requires authentication

If you see "not authenticated" in the `/mcp` menu:
1. Select "Authenticate"
2. Complete any prompts in Figma Desktop

---

## How It Works

```
Claude Code (WSL) ──────► Windows vEthernet IP:3845 ──────► Figma Desktop
                         (172.21.112.1)                    (listening on 3845)
```

WSL can directly reach the Windows host via the vEthernet adapter IP. Figma Desktop listens on this interface, so no tunneling is needed.

---

## Figma MCP Server Types

Figma offers two MCP server types:

| | Desktop Server | Remote Server |
|---|---|---|
| **Server name** | `figma-desktop` | varies |
| **Endpoint** | `/mcp` | `/sse` |
| **Transport** | HTTP | SSE |
| **Context** | Selection-based (knows what you selected in Figma) | Link-based (paste URLs) |
| **Requirement** | Figma Desktop app | Browser only |

This guide uses the **Desktop Server** for selection-based workflows.

---

## Quick Reference

```bash
# Check MCP status
claude mcp list

# Plugin config location (update IP here)
~/.claude/plugins/cache/claude-plugins-official/figma/1.0.0/.mcp.json

# Find Windows IP (in PowerShell)
ipconfig | findstr /C:"vEthernet (WSL)" /C:"IPv4"
```

---

## Appendix: SSH Tunnel Method (Alternative)

If the direct IP method doesn't work (e.g., firewall issues), you can use SSH tunneling as a fallback.

### One-Time Setup

**1. Install OpenSSH Server on Windows**

Open PowerShell as Administrator:

```powershell
# Install OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Start and enable the service
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# Allow through firewall
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```

**2. Create SSH User**

```powershell
# Create user (replace password with your own)
net user sshuser YourPasswordHere /add
net localgroup Administrators sshuser /add
```

**3. Create Tunnel Alias in WSL**

```bash
# Replace IP with your vEthernet (WSL) IP
echo "alias figma-tunnel='ssh -L 3845:localhost:3845 sshuser@172.21.112.1'" >> ~/.bashrc
source ~/.bashrc
```

**4. Configure MCP for localhost**

```bash
claude mcp remove figma-desktop
claude mcp add --transport http figma-desktop http://127.0.0.1:3845/mcp
```

### Daily Usage (Tunnel Method)

1. Open Figma Desktop on Windows
2. In WSL, run `figma-tunnel` and enter password
3. Keep that terminal open
4. Start Claude Code in a new terminal

### Troubleshooting Tunnel

| Issue | Fix |
|-------|-----|
| Connection refused | Start SSH: `Start-Service sshd` (PowerShell admin) |
| Connection timed out | IP changed - update alias in `~/.bashrc` |
| Port not forwarding | Check `AllowTcpForwarding yes` in `C:\ProgramData\ssh\sshd_config` |
