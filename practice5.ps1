Get-ChildItem -Path "C:\temp\test"
$file = Get-ChildItem -Path "C:\temp\test" | where {$_.Name -like "*.csv"} | Select
Name,Length
$sizeinKB = $file.Length/1KB
$sizeinMB = $file.Length/1MB
Write-Host "`nFileName : "$file.Name
Write-Host "Size in KB : "$sizeinKB
Write-Host "Size in MB : "$sizeinMB