# Block Execution by Command Line

## Overview
ENS Expert Rules allows us to write simple rules that usually written in a SIEM (using Sysmon logs for example), the advantage here is we can set the rule to prevent in real time (something a SIEM can't do)

## How can we use it?
We have the Match_Type PROCESS_CMD_LINE

## Example
Let's prevent execution of powershell when used with the encoded command flag

For that I created a list named listOfCmdLine, and in the Include section I defined a prefix and suffix with "**" (so we wouldn't have to put it in every string in the list manually)
```tcl
Rule {

    lappend listOfCmdLine "-Enc"

    Initiator {
        Match PROCESS {
            Include OBJECT_NAME { -v "**" }
        }
    }
    Target {
        Match PROCESS {
            Include OBJECT_NAME { -v "powershell.exe" }
            Include PROCESS_CMD_LINE {
                -pfx "**"
                -sfx "**"
                -l $listOfCmdLine
            }
        }
    }
}
```