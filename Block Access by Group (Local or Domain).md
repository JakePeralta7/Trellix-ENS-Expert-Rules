# Block Access by Group (Local or Domain)

## Overview
ENS Expert Rules allows us to write rules that takes into account factors such as:
- Which AD group is he a member of?
- Is he running with local admin rights?

## How can we use it?
We have the Match_Type GROUP_SID (Group Security Identifier)
- We can get a group's SID with the PowerShell command:
```powershell
(Get-ADGroup "GROUP_NAME").SID.Value
```
- The group SID of local admin is "S-1-16-12288" and "S-1-16-16384"

## Example
Let's prevent usage of cmd with admin privelges (obviously this rule is just for demonstration)
```tcl
Rule {

    lappend listOfGroups "S-1-16-12288"
    lappend listOfGroups "S-1-16-16384"

    Initiator {
        Match PROCESS {
            Include OBJECT_NAME { -v "**" }
            Include GROUP_SID {
                -l $listOfGroups
            }
        }
    }
    Target {
        Match PROCESS {
            Include OBJECT_NAME { -v "cmd.exe" }
        }
    }
}
```