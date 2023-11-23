$eesnimi = Read-Host "Sisesta oma eesnimi"
$perenimi = Read-Host "Sisesta oma perenimi"

if ($eesnimi -cmatch '^[A-Za-z]+$' -and $perenimi -cmatch '^[A-Za-z]+$') {
    $kasutajanimi = "$($eesnimi.ToLower()).$($perenimi.ToLower())"

    Write-Host "Loodav kasutaja on $kasutajanimi"
}

$ErrorActionPreference = ‘SilentlyContinue’
New-LocalUser -Name $kasutajanimi -Password (ConvertTo-SecureString "Parool1!" -AsPlainText -Force)

if ($?) {
    Write-Host "Kasutaja $kasutajanimi loodi edukalt!"
} else {
    Write-Host "Tekkinud probleem kasutaja loomisega"
}
