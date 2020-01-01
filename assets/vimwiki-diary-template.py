#!/usr/bin/python
import sys
import datetime
import os

template = """# {date}

## Daily checklist

* [ ] Wake Up Before 9am
* [ ] Meditate 10min
* [ ] Read 1hr

## Todo
* [ ]

## Distractions
* 

## Notes"""

date = (datetime.date.today() if len(sys.argv) < 2
                # Expecting filename in YYYY-MM-DD.foo format
                        else os.path.basename(sys.argv[1]).rsplit(".", 1)[0])
print(template.format(date=date))