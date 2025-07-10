# Mod de utilizare: administrator (tastele Win + X, A).
# Executam comenzile urmatoare in Terminal:
#
#   Set-ExecutionPolicy Unrestricted
#   ./lintare_si_copiere.ps1 un_singur_argument
#
# Lintarea fisierelor traducerii care au fost urcate pe GitHub 
# este realizata automat iar rezultatele acesteia
# se vad aici: [ https://python-docs-translations.github.io/dashboard/metadata.html ]

$un_singur_argument      = $args[0]  # captarea lui un_singur_argument
                                     # variante: nume_de_fisier, nume_de_director/nume_de_fisier,
                                     #           nume_de_director\nume_de_fisier
                                     # atentie:  fara nicio extensie dupa nume_de_fisier!
$subdirectorul           = $null     # aici il captam pe nume_de_director                         
$fisierul_fara_extensie  = $null     # aici il captam pe nume_de_fisier
$componentele_numelui    = $un_singur_argument -split { $_ -eq "/" -or $_ -eq "\" } 
$numarul_componentelor   = $componentele_numelui.Length
if( 2 -eq $numarul_componentelor )     
{
    $subdirectorul          = $componentele_numelui[0]
    $fisierul_fara_extensie = $componentele_numelui[1]
}  
else
{
    $fisierul_fara_extensie = $componentele_numelui[0]
} 
                         
$directorul_traducerii   = "C:\octavian\invatare_Python_2025\traducerea_documentatiei"
$directorul_fragmentelor = "locale_python_3_13_5\ro\LC_MESSAGES"

if( 2 -eq $numarul_componentelor )
{
    $directorul_fragmentelor = "$directorul_fragmentelor\$subdirectorul"
}

$directorul_versiunii    = "directorul_locale_cu_traduceri\$directorul_fragmentelor"
$proiectul_versiunii     = "proiectul_traducerii\Python-3.13.5\Doc"
$directorul_compilarii   = "$directorul_traducerii\$proiectul_versiunii\$directorul_fragmentelor"
$ce_traduc               = "$directorul_traducerii\$directorul_versiunii\$fisierul_fara_extensie.po"
$ce_compilez             = "$directorul_compilarii\$fisierul_fara_extensie.po"
$linterul                = "C:\octavian\instalare_python\instalat\Scripts\sphinx-lint.exe"
$argumentele             = $ce_traduc
$fisierul_cu_rezultate   = ".\rezultatul_lintarii.txt"
$succesul_lintarii       = "No problems found."

&$linterul $argumentele | Out-File -FilePath $fisierul_cu_rezultate
$calcul = ( Get-Content -Path $fisierul_cu_rezultate -TotalCount 1 | Out-String ).Trim()

if( $succesul_lintarii -eq $calcul ) 
{
    Remove-Item $fisierul_cu_rezultate
    if( Test-Path -Path $ce_compilez )
    {
        Remove-Item $ce_compilez
    }
    Copy-Item $ce_traduc -Destination $directorul_compilarii
}
else
{
    Write-Warning "Probleme la lintare!"
}
 
Set-ExecutionPolicy Restricted
