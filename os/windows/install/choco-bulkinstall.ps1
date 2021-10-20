Get-Content $args[0] | ForEach-Object {choco install $_ -y}
