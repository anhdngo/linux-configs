#!/usr/bin/python
import sys
import datetime
import os
import subprocess

template = """# {date}

{quote}
## Daily checklist

* [ ] Block Distracting Websites
* [ ] Wake Up Before 9am
* [ ] Meditate 10min
* [ ] Read 1hr -> Book(s): [ ]
* [ ] Deep work 1hr -> Project(s): [ ]
* [ ] Write Blog Post -> Post: [ ]

* [ ] DO NOT Watch Youtube
* [ ] DO NOT Check Email Between 9am and 9pm

## Goals For The Day
* [ ] 

## Activity Log
* 

## Distractions
* [ ] 

## Notes"""

date = (datetime.date.today() if len(sys.argv) < 2
                # Expecting filename in YYYY-MM-DD.foo format
                        else os.path.basename(sys.argv[1]).rsplit(".", 1)[0])
quote = subprocess.check_output("shuf -n 1 $VIMWIKI/quotes.md", shell=True).decode('utf-8')
print(template.format(quote=quote, date=date))
