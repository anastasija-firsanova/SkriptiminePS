function Translit {
    param (
        [string]$inputString
    )

    $translit = @{
        'ä' = 'a'
        'ö' = 'o'
        'ü' = 'u'
        'õ' = 'o'
    }

    $outputString = ""
    foreach ($character in $inputString.ToCharArray()) {
        if ($translit[$character] -ne $null) {
            $outputString += $translit[$character]
        } else {
            $outputString += $character
        }
    }
    Write-Output $outputString
}

$eesnimi = Read-Host "Sisesta kasutaja eesnimi"
$perenimi = Read-Host "Sisesta kasutaja perenimi"

$kasutajanimi = "$($eesnimi.ToLower())$($perenimi.ToLower())"
$kasutajanimiTranslit = Translit -inputString $kasutajanimi

$ErrorActionPreference = 'SilentlyContinue'
Remove-ADUser -Identity $kasutajanimiTranslit -Confirm:$false

if ($?) {
    Write-Host "Kasutaja $eesnimi $perenimi kustutati edukalt"
} else {
    Write-Host "Kasutaja ei eksisteeri või tekkis probleem kasutaja kustutamisega, palun proovige uuesti."
}