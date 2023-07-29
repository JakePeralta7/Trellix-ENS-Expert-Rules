# 

```tcl
Rule {
	Initiator {
		Match PROCESS {
			Include OBJECT_NAME {
				-v "**"
			}
			Exclude VTP_PRIVILEGES -type BITMASK {
				-v 0x8
			}
		}
	}
	Target {
		Match PROCESS {
			Include OBJECT_NAME {
				-v "Sysmon.exe"
				-v "Sysmon64.exe"
			} 
			Include -access "DELETE TERMINATING"
			Exclude -access "CREATE"
		}
	}
}
```