# Generates the Intune backup locally
INTRO="Endpoint Manager backup and documentation generated at locally. <img align=\"right\" width=\"96\" height=\"96\" src=\"./logo.png\">"
IntuneCD-startdocumentation \
    --path="$PWD/prod-backup" \
    --outpath="$PWD/prod-as-built.md" \
    --tenantname="stealthpuppylab.onmicrosoft.com" \
    --intro=$INTRO
    #--split=Y

# Creates the as-built documentation
md-to-pdf "$PWD/prod-as-built.md" --pdf-options '{ "format": "A4", "margin": "10mm", "printBackground": false }'
