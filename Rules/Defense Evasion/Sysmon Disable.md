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
		Match VALUE {
			Include OBJECT_NAME { 					
				-v "HKLM\\SOFTWARE\\Microsoft\\Windows\\*\\WINEVT\\Channels\\Microsoft-Windows-Sysmon/Operational\\Enabled"
			}
			Include REGVAL_DATA -type INT64 {
               -v 0
            }
			Include -access "WRITE"
		}
	}
}
```

## Resources

Rule {
	Initiator {
		Match PROCESS {
			Include OBJECT_NAME {
				-v "explorer.exe"
			}
		}
    }
	Target {
		Match PROCESS {
			Include OBJECT_NAME {
				-v "cmd.exe"
			}
		}
	}
	Next_Process_Behavior {
		Target {
			Match PROCESS {
				Include OBJECT_NAME {
					-v "regedit.exe"
				}
			}
		}
	}
}