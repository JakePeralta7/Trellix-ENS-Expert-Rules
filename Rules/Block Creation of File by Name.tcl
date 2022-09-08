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