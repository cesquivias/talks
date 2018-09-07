#!/usr/bin/env python

import sys

from collections import defaultdict
from xml.dom.minidom import parse

file_lines = defaultdict(list)
dom = parse(sys.argv[1])

for problem in dom.getElementsByTagName('problem'):
    if 'Using left/right instead of start/end attributes' not in problem.getElementsByTagName('problem_class')[0].firstChild.nodeValue:
        continue
    filename = problem.getElementsByTagName('file')[0].firstChild.nodeValue[21:]
    line_number = problem.getElementsByTagName('line')[0].firstChild.nodeValue
    file_lines[filename].append(line_number)

for filename, lines in file_lines.iteritems():
    print "sed -i -e '%s' %s" % (';'.join(l + 'd' for l in lines),
                                 filename)
