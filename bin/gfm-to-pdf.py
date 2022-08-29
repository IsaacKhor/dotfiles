#!/usr/bin/env python3

import requests
import sys
import os
import subprocess

script_dir = os.path.dirname(__file__)
template_rel = "md-html.template.html"
template_path = os.path.join(script_dir, template_rel)

infile = sys.argv[1]
infile_name = os.path.splitext(infile)[0]
htmlout = infile_name + ".html"
pdfout = infile_name + ".pdf"

with open(infile, 'rb') as f:
    mdcontent = f.read()

with open(template_path) as t:
    template = t.read()

endpoint = "https://api.github.com/markdown/raw"
headers = {"Content-Type": "text/x-markdown"}

# Use Github to render markdown
resp = requests.post(endpoint, headers=headers, data=mdcontent)

rendered_html = template.replace("__REPLACE_ME_WITH_RENDERED_MD__", resp.text)

with open(htmlout, 'w') as o:
    o.write(rendered_html)

# Use wkhtmltopdf to render the html from the github API
subprocess.run(["wkhtmltopdf", htmlout, pdfout])

# Cleanup: delete the generated HTML
os.remove(htmlout)