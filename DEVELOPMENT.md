# Development

This document describes how to set up your environment for developing and
buliding this mod.

## Requirements

- Windows 10
  - You may be able to use Linux, Mac OS, and other versions of Windows, but I
    haven't tested them.
- [PowerShell 7](https://github.com/powershell/powershell#readme)
  - The PowerShell scripts are written for Windows and may need to be adapted
    for Linux or Mac OS.
  - The PowerShell scripts are simple and can be adpated to other languages, and
    the commands therein can be ran directly.
- [Git](https://git-scm.com/)
  - Alternatively, you can download the
    [source code](https://github.com/jordanbtucker/botw-no-loot-boxes/archive/refs/heads/master.zip).
- [Python 3.8](https://www.python.org/)
  - Other versions of Python may work, but I haven't tested them.

## Setup

Clone the Git repository.

```
git clone https://github.com/jordanbtucker/botw-no-loot-boxes.git
cd botw-no-loot-boxes
```

Alternatively, download and extract the
[source code](https://github.com/jordanbtucker/botw-no-loot-boxes/archive/refs/heads/master.zip),
then open a terminal in the extracted folder.

Install the required Python packages.

```
pip install -r requirements.txt
```

Run BCML, and complete its initial setup.

```
bcml
```

Copy the following `Item_Amiibo_DropTable_*.sbactorpack` files from
`content/Actor/Pack` from the latest update of Breath of the Wild to the
`src/packs` folder. Obtaining the game files is outside the scope of this
project.

- `Item_Amiibo_DropTable_001.sbactorpack`
- `Item_Amiibo_DropTable_002.sbactorpack`
- `Item_Amiibo_DropTable_003.sbactorpack`
- `Item_Amiibo_DropTable_007.sbactorpack`
- `Item_Amiibo_DropTable_009.sbactorpack`
- `Item_Amiibo_DropTable_012.sbactorpack`
- `Item_Amiibo_DropTable_013.sbactorpack`
- `Item_Amiibo_DropTable_014.sbactorpack`
- `Item_Amiibo_DropTable_015.sbactorpack`
- `Item_Amiibo_DropTable_018.sbactorpack`
- `Item_Amiibo_DropTable_019.sbactorpack`
- `Item_Amiibo_DropTable_020.sbactorpack`
- `Item_Amiibo_DropTable_021.sbactorpack`
- `Item_Amiibo_DropTable_022.sbactorpack`
- `Item_Amiibo_DropTable_023.sbactorpack`

The rest of the `Item_Amiibo_DropTable_*.sbactorpack` files are not needed since
they do not contain any exclusive drops. It is normal for
`Item_Amiibo_DropTable_011.sbactorpack` to be missing altogether.

# Making Changes

Open the folder in your preferred text editor.
[Visual Studio Code](https://code.visualstudio.com/) is recommended.

Make any desired modifications to the `Item_Amiibo_DropTable_*.yml` files in
`src/tables`.

# Building

Run `update.ps1`, which will generate `*.sbactorpack` files into the `out`
folder containing the changes made to their corresponding `*.yml` files in the
`src/tables` folder.

```
update.ps1
```

If creating a new mod based on this one, change the default values in
`build.ps1`.

Run `build.ps1` which will generate `*.bnp` and `*.zip` files into the `dist`
folder from the `*.sbactorpack` files in the `out` folder. `build.ps1` requires
a `Version` argument. Follow [Semantic Versioning](https://semver.org/) when
choosing the version.

```
build.ps1 -Version 1.0.3
```
