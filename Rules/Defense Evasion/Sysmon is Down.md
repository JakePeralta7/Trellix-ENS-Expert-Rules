# 

```tcl
Rule {
	Initiator {
		Match PROCESS {
			Include OBJECT_NAME {
				-v "**"
			}
			Include PROCESS_CMD_LINE {
				-v "C:\\Windows\\Sysmon64.exe"
			}
		}
    }
	Target {
		Match PROCESS {
			Include OBJECT_NAME {
				-v "Sysmon.exe"
				-v "Sysmon64.exe"
			} 
			Include -access "TERMINATING"
		}
	}
}
```