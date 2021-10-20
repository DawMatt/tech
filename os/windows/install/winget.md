# Winget - Windows Package Manager

[Winget](https://github.com/microsoft/winget-cli) is a package manager for Windows that has a growing selection of packages available and can also manage/upgrade applications that weren't installed by winget.

To aid in its usage we have produced the following utility scripts:

| Script | Purpose |
| --- | --- |
| [winget-bulkinstall](winget-bulkinstall.ps1) | Bulk installs all packages identified in the file nominated as a command line argument. Usage example:  `winget-bulkinstall.ps1 winget-pkgscore.txt` |
| [winget-bulkcheck](winget-bulkcheck.ps1) | Bulk retrieves details about all packages identified in the file nominated as a command line argument. Useful when testing the data file before using it with bulkinstall. Usage example:  `winget-bulkcheck.ps1 winget-pkgscore.txt` |

Some sample package lists have been provided for use with the bulk install command.
