Get-ChildItem -File .\content\Actor\Pack\*.sbactorpack | ForEach-Object { sarc x $_.FullName }
Get-ChildItem -File -Recurse -Include *.bdrop | ForEach-Object {
  $file = Get-Item $_.FullName
  $outPath = "$($file.Directory.FullName)\$($file.BaseName).yml"
  aamp $file.FullName > $outPath
}
