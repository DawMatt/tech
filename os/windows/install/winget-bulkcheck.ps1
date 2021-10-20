Get-Content $args[0] | ForEach-Object {winget show --id $_ }
