#!/usr/bin/env python

import re
import sys

from collections import defaultdict

file_lines = defaultdict(list)

with open(sys.argv[1]) as f:
    for line in f:
        line = line.strip()
        if line.startswith('<file>'):
            filename = re.findall(r'>(.*)<', line)[0][21:]
        elif line.startswith('<line>'):
            line_number = re.findall(r'>(\d+)<', line)[0]
        elif line.startswith('<problem_class') and \
             'Using left/right instead of start/end attributes' in line:
            file_lines[filename].append(line_number)

'''
Now, `lines` will look something like...

{
'.../activity_login.xml': [87, 90],
...
}
'''

for filename, lines in file_lines.iteritems():
    print "sed -i -e '%s' %s" % (';'.join(l + 'd' for l in lines),
                                 filename)
            
