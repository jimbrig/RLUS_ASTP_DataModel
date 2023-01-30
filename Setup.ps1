



# Create Catalog
New-FileCatalog -Path . -CatalogFilePath .\TablesCatalog.cat -CatalogVersion 1.0

# Check for Changes
Test-FileCatalog .\TablesCatalog.cat


