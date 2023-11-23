$eesnimi = Read-Host "Sisesta oma eesnimi"
$perenimi = Read-Host "Sisesta oma perenimi"

if ($eesnimi -cmatch '^[A-Za-z]+$' -and $perenimi -cmatch '^[A-Za-z]+$') {
    $kasutajanimi = "$($eesnimi.ToLower()).$($perenimi.ToLower())"

    Write-Host "Loodav kasutaja on $kasutajanimi"
}

$parool = ConvertTo-SecureString "Parool1!" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($kasutajanimi, $parool)

$userCreationResult = New-LocalUser -Name $kasutajanimi -Password $parool -ErrorAction SilentlyContinue

if ($?) {
    Write-Host "Kasutaja $kasutajanimi loodi edukalt!"
} else {
    Write-Host "Tekkinud probleem kasutaja loomisega $($userCreationResult.Exception.Message)"
}
