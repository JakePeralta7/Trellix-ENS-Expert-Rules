# Block Creation of File by Name

## Author
Elad Levi

## Description
Just an example to showcase usage of expert rules

## Rule Class 
Files

## Rule TCL
```tcl
Rule {
	Initiator {
		Match PROCESS {
			Include OBJECT_NAME {-v "*"}
		}
	}
	Target {
		Match FILE {
			Include -access "CREATE"
			Include OBJECT_NAME {-v "*ugly*"}
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
