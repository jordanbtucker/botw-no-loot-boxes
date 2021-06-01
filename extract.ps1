# Extracts *.sbactorpack files and converts *.bdrop files to *.yml files.

$packsDir = ".\src\packs"
$tablesDir = ".\src\tables"
$extractRoot = ".\tmp\content\Actor\Pack"

# Create extract root directory
if (-not (Test-Path $extractRoot)) {
  New-Item -ItemType Directory -Force $extractRoot
}

# Extract the *.sbactorpack files
Get-ChildItem -File "$packsDir\*.sbactorpack" | ForEach-Object {
  $extractDir = "$extractRoot\$($_.BaseName)"
  sarc x --directory $extractDir $_.FullName
}

# Create the tables directory
if (-not (Test-Path $tablesDir)) {
  New-Item -ItemType Directory -Force $tablesDir
}

# Convert each *.bdrop file to a *.yml file if it doesn't exist
Get-ChildItem -File -Recurse -Include *.bdrop $extractRoot | ForEach-Object {
  $file = Get-Item $_.FullName
  $outPath = "$tablesDir\$($file.BaseName).yml"
  if (-not (Test-Path $outPath)) {
    aamp $file.FullName > $outPath
  }
}
