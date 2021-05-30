if (-not (Test-Path src)) {
  New-Item -ItemType Directory src
}

Get-ChildItem -File .\content\Actor\Pack\*.sbactorpack | ForEach-Object { sarc x $_.FullName }
Get-ChildItem -File -Recurse -Include *.bdrop .\content\Actor\Pack\ | ForEach-Object {
  $file = Get-Item $_.FullName
  $outPath = ".\src\$($file.BaseName).yml"
  aamp $file.FullName > $outPath
}
