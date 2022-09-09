# Usage of Debugger in Image File Execution Options

## Author
Elad Levi

## Description
The Debugger registry key can allow an adversary to intercept the execution of files, causing a different process to be executed. This functionality can be abused by an adversary to establish persistence.

## Rule Class 
Registry

## Rule TCL
```tcl
Rule {
	Process {
		Include OBJECT_NAME {
			-v "**" 
		}
	}
	Target {
		Match VALUE {
			Include OBJECT_NAME {
				-v "**\\Image File Execution Options\\*\\Debugger"
			}
			Include -access "CREATE WRITE"
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
