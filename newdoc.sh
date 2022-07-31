# Generate the as-built document in markdown
INTRO="Endpoint Manager backup and documentation generated at locally. <img align=\"right\" width=\"96\" height=\"96\" src=\"./logo.png\">"
IntuneCD-startdocumentation \
    --path="$PWD/prod-backup" \
    --outpath="$PWD/prod-as-built.md" \
    --tenantname="stealthpuppylab.onmicrosoft.com" \
    --intro=$INTRO
    #--split=Y

# Generate a PDF document from the as-built markdown
md-to-pdf "$PWD/prod-as-built.md" \
    --config-file ./md2pdf/pdfconfig.json

# Generate a HTML document from the as-built markdown
md-to-pdf "$PWD/prod-as-built.md" \
    --config-file ./md2pdf/htmlconfig.json --as-html