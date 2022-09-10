# Cheatsheet

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

-v		value

-l		list

-pfx	prefix

-sfx	suffix

## Include/Exclude AggregateMatch
we can use this function to join a group of in/exclude

## Notes
TCL Version is 7.6
### TCL Special Chars
", $, [, ], \, _