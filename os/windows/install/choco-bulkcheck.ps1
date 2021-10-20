Get-Content $args[0] | ForEach-Object {choco info $_ -y}
