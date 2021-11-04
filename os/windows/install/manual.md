# Manual Installations

Where possible we should try to utilise the package management applications described in the [install guide overview](../install.md).

If we must proceed with manual application management we will proceed as follows:

- start with the same set of core and development applications described in the winget and choco package lists
- determine whether the applications can fit within the available constraints
- either remove the application from consideration, relax the constraints (potentially on an application by application basis), or identify an alternative

Following is a list of the applications mentioned in the sample package lists, identifying the ability for them to fit within typical installation constraints.

## Core applications

| Application | Admin Required? | Install Scope | Comments|
| --- | --- | --- | --- |
| Google.Chrome | No | User | |
| LogMeIn.LastPass | N/A | N/A | Alternative - Browser extension |
| Yubico.Authenticator | Y | System | |
| Twilio.Authy | - | - | Not attempted |
| Doist.Todoist | N | User | Possible alternative - Web only |
| Microsoft.VisualStudioCode | No | User | |
| Joplin.Joplin | No | User | |
| 7zip.7zip | - | - | Not attempted - preinstalled |
| JGraph.Draw | No | User | |
| EDRLab.Thorium | No | User | |
| WinMerge.WinMerge | No | User | |

## Development applications

| Application | Admin Required? | Install Scope | Comments|
| --- | --- | --- | --- |
| Postman.Postman | No | User | |
| GitHub.GitHubDesktop | No | User | |
| Git.Git | Yes | System | |
| Microsoft.VisualStudio.2019.Enterprise | Yes | System | |
| Microsoft.AzureCLI | Yes | System | |
| Microsoft.AzureDataStudio | No | User | |
| Microsoft.SQLServerManagementStudio | Yes | System | |
| OpenJS.NodeJS.LTS | Yes | System | "Automatically install required components" also installed Chocolatey and Python 3 |
| Python.Python.3 | - | - | Installed via Node.js |
