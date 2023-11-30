$file = "C:\Users\Administrator\Documents\adkasutajad.csv"
$kasutajad = Import-Csv $file -Encoding Default -Delimiter ";"

foreach ($kasutaja in $kasutajad) {
    $eesnimi = $kasutaja.FirstName
    $perenimi = $kasutaja.LastName
    $kasutajanimi = $kasutaja.SamAccountName
    $kasutajanimi = $kasutajanimi.ToLower()

        $ErrorActionPreference = 'SilentlyContinue'
        $defaultPassword = ConvertTo-SecureString "Parool1" -AsPlainText -Force
        New-ADUser -SamAccountName $kasutajanimi -GivenName $eesnimi -Surname $perenimi -Department $kasutaja.Department -Title $kasutaja.Role -UserPrincipalName "$kasutajanimi@mukri.sise" -Name "$eesnimi $perenimi" -Enabled $true -AccountPassword $defaultPassword
        if ($?) {
            Write-Host "User $kasutajanimi created successfully!"
        } else {
            Write-Host "User $kasutajanimi already exists - cannot add this user"
        }
    }