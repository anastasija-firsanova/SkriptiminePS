$groups = @("Red","Green","Yellow","Blue")
$result = @()
for($i = 1 ; $i-le 20 ; $i++) { $g = Get-Random $groups $temp = [PSCustomObject]@{ RollNumber = $i Group = $g } $result += $temp }
$result