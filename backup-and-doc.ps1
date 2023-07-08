New-Item -Path "$PWD/prod-backup" -ItemType "Directory"
IntuneCD-startbackup --mode=1 --output=json --path="$PWD/prod-backup" --localauth="$PWD/auth.json"
    #--exclude=assignments

# Generate the as-built document in markdown
$Auth = Get-Content -Path "$PWD/auth.json" | ConvertFrom-Json
$INTRO="Endpoint Manager backup and documentation generated locally. <img align=`"right`" width=`"96`" height=`"96`" src=`"./logo.png`">"
IntuneCD-startdocumentation --path="$PWD/prod-backup" --outpath="$PWD/prod-as-built.md" --tenantname="$($Auth.TENANT_NAME)" --intro="$INTRO"

# Generate a PDF document from the as-built markdown
md-to-pdf "$PWD/prod-as-built.md" --config-file ./md2pdf/pdfconfig.json

# Generate a HTML document from the as-built markdown
md-to-pdf "$PWD/prod-as-built.md" --config-file ./md2pdf/htmlconfig.json --as-html
