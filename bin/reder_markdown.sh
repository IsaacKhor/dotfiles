#!/usr/bin/env bash

if [ $# -ne 3 ]; then
    echo "Usage: ./render_markdown.sh <path/to/md.md> <path/to/output.html <title>"
    exit 0
fi

curl https://api.github.com/markdown/raw -X "POST" -H "Content-Type: text/plain" \
        --data-binary "@$1" > /tmp/rendered.html

printf '
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui">
    <title>%s</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/4.0.0/github-markdown.min.css" integrity="sha512-Oy18vBnbSJkXTndr2n6lDMO5NN31UljR8e/ICzVPrGpSud4Gkckb8yUpqhKuUNoE+o9gAb4O/rAxxw1ojyUVzg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
            body {
                box-sizing: border-box;
                min-width: 200px;
                max-width: 980px;
                margin: 0 auto;
                padding: 45px;
            }
        </style>
</head>
<body class="markdown-body">
%s
</body>
</html>
' "$3" "`cat /tmp/rendered.html`" > "$2"


