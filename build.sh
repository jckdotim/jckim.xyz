#!/bin/bash

BASE_HTML="index.base.html"
OUTPUT_HTML="index.html"

npm install -D tailwindcss
npx tailwindcss -i ./tailwind.input.css -o ./tailwind.min.css --minify

# Inline the minified CSS into the output HTML file

# Read the CSS file, escape special characters, and wrap it in <style> tags
CSS_CONTENT=$(cat tailwind.min.css | sed -e 's/[\/&]/\\&/g')
CSS_CONTENT="<style>\n${CSS_CONTENT}\n</style>"

# Replace the <link> tag with the CSS content in the HTML file
# Create a temporary file
TMP_FILE=$(mktemp)

# Insert the content of the CSS file wrapped in <style> tags at the location of the <link> tag
awk -v css_file="tailwind.min.css" '
/<link href="tailwind.min.css" rel="stylesheet">/ {
    print "<style>"
    while ((getline < css_file) > 0) {
        print
    }
    print "</style>"
    next
}
1
' "${BASE_HTML}" > "${TMP_FILE}"

# Move the temporary file to the output file
mv "${TMP_FILE}" "${OUTPUT_HTML}"

echo "Successfully inlined minified Tailwind CSS in index.html"
