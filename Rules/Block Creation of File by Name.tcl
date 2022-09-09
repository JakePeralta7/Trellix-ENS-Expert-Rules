# Detect new code injection method in Microsoft Office CVE-2022-30190

## Author
Elad Levi

## Description
A recent maldoc contained a novel way of downloading and injecting code using the msdt.exe tool to execute PowerShell and download malicious code #CVE-2022-30190

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
