param (
  [Parameter(Mandatory)]
  [string]
  $Version
)

# Mod metadata. Change these values if creating a new mod.
$basename = 'NoLootBoxes'
$name = 'No Loot Boxes'
$description = 'Guarantees exclusive items from amiibo'
$imageURL = 'https://images.gamebanana.com/img/ss/mods/60b513c3afb90.jpg'
$url = 'https://gamebanana.com/mods/290840'

# Replace `.` with `_` in the version for filenames.
$fileVersion = $Version.Replace(".", "_")

# Create the BNP file for BCML.
bnptool create `
  -n $name `
  -d $description `
  -v $Version `
  -i $imageURL `
  -u $url `
  -o .\dist\$basename-v$fileVersion.bnp `
  .\out

# Create the ZIP file for Wii U.
Compress-Archive `
  -Path .\src\rules.txt, .\out\* `
  -DestinationPath .\dist\$basename-v$fileVersion.zip
