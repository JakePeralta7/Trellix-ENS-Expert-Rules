# Block Access by Group (Local or Domain)

## Overview
ENS Expert Rules allows us to write rules that takes into account factors such as:
- Which AD group is he a member of?
- Is he running with local admin rights?

## How can we use it?
We have the MATCH_TYPE GROUP_SID (Group Security Identifier)
- We can get a group's SID with the PowerShell command:
```powershell
(Get-ADGroup "GROUP_NAME").SID.Value
```
- The group SID of local admin is "S-1-16-12288" and "S-1-16-16384"