Rule {
	Initiator {
		Match PROCESS {
			Include OBJECT_NAME {-v "*"}
		}
	}
	Target {
		Match FILE {
			Include -access "READ WRITE RENAME"
			Include SHA2_256 {-v "HASH"}
		}
	}
}