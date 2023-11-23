$eesnimi = Read-Host "Sisesta oma eesnimi"
$perenimi = Read-Host "Sisesta oma perenimi"

if ($eesnimi -cmatch '^[A-Za-z]+$' -and $perenimi -cmatch '^[A-Za-z]+$') {
    $kasutajanimi = "$($eesnimi.ToLower()).$($perenimi.ToLower())"

    Write-Host "Kustutav kasutaja on $kasutajanimi"
}

try {
    $ErrorActionPreference = ‘SilentlyContinue’
    Get-LocalUser -Name $kasutajanimi
} catch {
}
try {
    Remove-LocalUser -Name $kasutajanimi
    Write-Host "Kasutaja $kasutajanimi on kustutatud"
} catch {
    Write-Host "Tekkinud probleem kasutaja kustutamisega"
}