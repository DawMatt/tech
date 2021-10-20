Get-Content $args[0] | ForEach-Object {winget install $_ }
