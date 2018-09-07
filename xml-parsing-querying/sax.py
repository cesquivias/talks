#!/usr/bin/env python

import sys

from collections import defaultdict
from xml.sax import make_parser
from xml.sax.handler import ContentHandler

class LintHandler(ContentHandler):
    def __init__(self, file_lines):
        self.file_lines = file_lines

        self.filename = None
        self.line_number = None
        self.problem_class = None

        self.in_file = False
        self.in_line = False
        self.in_problem_class = False

    def startElement(self, name, attrs):
        if name == 'file':
            self.in_file = True
            self.filename = ''
        elif name == 'line':
            self.in_line = True
            self.line = ''
        elif name == 'problem_class':
            self.in_problem_class = True
            self.problem_class = ''

    def endElement(self, name):
        if name == 'file':
            self.in_file = False
        elif name == 'line':
            self.in_line = False
        elif name == 'problem_class':
            self.in_problem_class = False
        elif name == 'problem':
            if 'Using left/right instead of start/end attributes' in self.problem_class:
                self.file_lines[self.filename[21:]].append(self.line)

    def characters(self, text):
        if self.in_file:
            self.filename += text
        elif self.in_line:
            self.line += text
        elif self.in_problem_class:
            self.problem_class += text

file_lines = defaultdict(list)

parser = make_parser()
parser.setContentHandler(LintHandler(file_lines))
with open(sys.argv[1]) as f:
    parser.parse(f)

for filename, lines in file_lines.iteritems():
    print "sed -i -e '%s' %s" % (';'.join(l + 'd' for l in lines),
                                 filename)
