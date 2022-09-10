# Block Access by Group (Local or Domain)

## Overview
ENS Expert Rules allows us to write rules that takes into account factors such as:
- Which AD group is he a member of?
- Is he running with local admin rights?

## How can we use it?
We have the MATCH_TYPE GROUP_SID (Group Security Identifier), we can get a group's SID with the command:
```powershell
(Get-ADGroup "GROUP_NAME").SID.Value
```