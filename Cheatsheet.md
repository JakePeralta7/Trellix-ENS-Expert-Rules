# Cheatsheet

## McAfee Endpoint Security Console
This is where we are going to write the expert rules
why?
- we can check the rule
- impact is low because it's local (unlike ePO)

## AACInfo Tool
Location: "C:\Program Files\Common Files\McAfee\SystemCore\aacinfo.exe"

aacinfo report - command that can be used to get events in real time

aacinfo query - command used to get all AAC rules (we can reverse engineer McAfee's rules with this tool)
```batch
aacinfo query > some_xml_file.xml
```

Help: aacinfo /?

## AAC Structure
- Initiator, the object commiting the action (can Match only PROCESS/THREAD)
- Target, the object the action comitted on (can Match all objects)

The rules are Include/Exclude inside the Match section

## Shortcuts
In/Exclude ACCESS_MASK {-v "XXXX" "YYYY" "ZZZZ"}        =   In/Exclude -access "XXXX YYYY ZZZZ"

## AAC Wildcards
? - every single char

\* - zero to infinity chars (except \\)

** - zero to infinity chars (including \\)

## AAC Escape Char
| - removes the functionality of the following char

\ - an escape char for TCL

## Using Variables and Lists in TLC
```tlc
set <variable_name> <value>
```

```tlc
lappend <list_name> <value>
-l $<list_name>
```

We can use -v <value> and -l $<list> together
```tlc
In/Exclude MatchType {
    -l $someList
    -v "someValue"
}
```

-v		"value"

-l		$list

-pfx	"prefix"

-sfx	"suffix"

## Include/Exclude AggregateMatch
we can use this function to join a group of in/exclude

## Commands
```tlc
iEnv <ENV_VAR>
```
```tlc
iSystem <var>
	examples: os_arch (640 = 64-bit, 320 = 32-bit)
```
```tlc
iTerminate "Some Message" ;# Stops the rule from applying on current computer
```
```tlc
iReg value <KEY> <VALUE>
```
```tlc
llength $<object> - returns the length of the object
```
```tlc
lindex $<list_obj> $<index>
```
```tlc
iUtil cvt2args $<string> ;# Converts to args (splits spaces, keeps "" as one arg)
```
```tlc
string trim $<var> <chars> ;# Removes the chosen chars from the given var
```

## Conditions and Loops
```tlc
if {$<var_name> == "someValue"} {
	<whatever>
}
else {
	<something>
}
```
```tlc
for {set x <start_value>} {condition} {<changing x>} {
	<something>
}
```

## Notes
TCL Version is 7.6
### TCL Special Chars
", $, [, ], \\, _