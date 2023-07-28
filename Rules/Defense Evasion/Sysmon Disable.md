# 

## Author
Elad Levi

## Description

## Rule Class
Registry

## Rule TCL
```tcl
Rule {
	Initiator {
		Match PROCESS {
			Include OBJECT_NAME {
				-v "**"
			}
		}
    }
	Target {
		Match KEY {
			Include OBJECT_NAME { 					
				-v "**\\Control\\WMI\\Autologger\\EventLog-Microsoft-Windows-Sysmon-Operational"
			}
			Include -access "DELETE"
		}
	}
}
```

## Resources
