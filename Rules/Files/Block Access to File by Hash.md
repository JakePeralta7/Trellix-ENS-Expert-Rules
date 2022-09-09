# Block Access to File by Hash

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
			Include -access "READ WRITE RENAME"
			Include SHA2_256 {-v "HASH" "ANOTHER_HASH"}
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
