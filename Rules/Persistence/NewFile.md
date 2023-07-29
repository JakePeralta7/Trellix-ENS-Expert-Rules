# 

Include DLL_LOADED -name "teste" { -v 0x1 }
Rule {
	Initiator {
		Match PROCESS {
			Include OBJECT_NAME { 					
				-v "C:\\Program Files (x86)\\Notepad++\\notepad++.exe"
				-v "C:\\Program Files\\Notepad++\\notepad++.exe"
			}
		}
    }
	Target {
		Match SECTION {
			Include OBJECT_NAME { 					
				-v "C:\\Program Files\\Notepad++\\plugins\\*\\*.dll"
				-v "C:\\Program Files (x86)\\Notepad++\\plugins\\*\\*.dll"
			}
			Include -access "CREATE"
		}
	}
}


https://pentestlab.blog/2022/02/14/persistence-notepad-plugins/