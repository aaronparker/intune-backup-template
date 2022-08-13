mkdir -p "$PWD/prod-backup"
IntuneCD-startbackup --mode=1 --output=json --path="$PWD/prod-backup" --localauth="$PWD/auth.json"
    #--exclude=assignments

# Generate the as-built document in markdown
INTRO="Endpoint Manager backup and documentation generated locally. <img align=\"right\" width=\"96\" height=\"96\" src=\"./logo.png\">"
IntuneCD-startdocumentation --path="$PWD/prod-backup" --outpath="$PWD/prod-as-built.md" --tenantname="stealthpuppylab.onmicrosoft.com" --intro=$INTRO

# Generate a PDF document from the as-built markdown
md-to-pdf "$PWD/prod-as-built.md" --config-file ./md2pdf/pdfconfig.json

# Generate a HTML document from the as-built markdown
md-to-pdf "$PWD/prod-as-built.md" --config-file ./md2pdf/htmlconfig.json --as-html
