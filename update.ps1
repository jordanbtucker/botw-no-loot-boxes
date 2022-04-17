# Converts *.yml files to *.bdrop files and packs them into *.sbactorpack files.

$outRoot = ".\out"
$outDir = "$outRoot\content\Actor\Pack"
$packsDir = ".\src\packs"
$tablesDir = ".\src\tables"
$extractRoot = ".\tmp\content\Actor\Pack"

# Convert each *.yml file to *.bdrop file
Get-ChildItem -File "$tablesDir\*.yml" | ForEach-Object {
  $file = Get-Item $_.FullName
  $baseName = $file.BaseName
  $outPath = "$extractRoot\$baseName\Actor\DropTable\$baseName.bdrop"
  aamp "$($file.FullName)" "$outPath"
}

# Create out root directory
if (-not (Test-Path $outDir)) {
  New-Item -ItemType Directory -Force $outDir
}

# Copy *.sbactorpack files to out directory
Get-ChildItem -File "$packsDir\*.sbactorpack" | ForEach-Object {
  Copy-Item $_.FullName "$outDir\$($_.Name)"
  $baseName = $_.BaseName
  sarc u "$extractRoot\$baseName" "$outDir\$baseName.sbactorpack"
}
