# Detect CobaltStrike Load by Rundll32

## Author
Elad Levi

## Description
The command and control (C2) Cobalt Strike often delivers beacon payloads in the form of DLLs. We reliably observe Cobalt Strike leveraging Rundll32 to call the StartW export function and load DLLs from the command line.

https://redcanary.com/threat-detection-report/techniques/rundll32/

## Rule Class 
Processes

## Rule TCL
```tcl
The original rule: 
Rule {
    Process {
        Include OBJECT_NAME { -v "**" }
    }
    Target {
        Match PROCESS {
            Include OBJECT_NAME { -v "rundll32.exe" }
            Include PROCESS_CMD_LINE {
                -v "**.dll*StartW**"
            }
            Include -access "CREATE" ; # Prevents process creation
        }
    }
}
```

## Trigger
NA

## Tested Platforms
OS: Windows 10 1909 x64
ENS: 10.7.0

## Notes
Customers are advised to fine-tune the rule in their environment or disable the signature if there are false positives.
