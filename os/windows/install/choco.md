# Chocolatey - Package Manager

[Chocolatey](https://chocolatey.org/) is a package manager for Windows that has a wide selection of packages available.

To aid in its usage we have produced the following utility scripts:

| Script | Purpose |
| --- | --- |
| [choco-setup](choco-setup.ps1) | Downloads and installs Chocolately directly from the official site |
| [choco-bulkinstall](choco-bulkinstall.ps1) | Bulk installs all packages identified in the file nominated as a command line argument. Usage example:  `choco-bulkinstall.ps1 choco-pkgscore.txt` |
| [choco-bulkcheck](choco-bulkcheck.ps1) | Bulk retrieves details about all packages identified in the file nominated as a command line argument. Useful when testing the data file before using it with bulkinstall. Usage example:  `choco-bulkcheck.ps1 choco-pkgscore.txt` |

Some sample package lists have been provided for use with the bulk install command.
