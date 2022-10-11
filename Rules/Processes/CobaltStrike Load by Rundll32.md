# Detect CobaltStrike Load by Rundll32

## Author
Elad Levi

## Description
A recent maldoc contained a novel way of downloading and injecting code using the msdt.exe tool to execute PowerShell and download malicious code #CVE-2022-30190

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
