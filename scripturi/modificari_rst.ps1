# Mod de utilizare: administrator (tastele Win + X, A).
#
# Git-ul este instalat global. Folosim comanda documentata aici:
# [ https://git-scm.com/docs/git-diff#Documentation/git-diff.txt-gitdiffoptions--no-index--pathpathpathspec ]
#
# Pentru anumite fragmente de cod Python a fost dezactivata traducerea
# (ele nu apar in fisierele *.po). Pentru a forta aparitia lor, fisierele
# *.rst respective se modifica manual.
#
# Executam comenzile urmatoare in Terminal:
#
#   Set-ExecutionPolicy Unrestricted
#   ./modificari_rst.ps1 un_singur_argument

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
                         
$directorul_traducerii             = "C:\octavian\invatare_Python_2025\traducerea_documentatiei"
$directorul_fisierului_nemodificat = "Python-3.13.6\Doc"
$directorul_fisierului_modificat   = "proiectul_traducerii\Python-3.13.7\Doc"

if( 2 -eq $numarul_componentelor )
{
    $directorul_fisierului_nemodificat = "$directorul_fisierului_nemodificat\$subdirectorul"
    $directorul_fisierului_modificat   = "$directorul_fisierului_modificat\$subdirectorul"
}

$fisierul_nemodificat  = "$directorul_fisierului_nemodificat\$fisierul_fara_extensie.rst"
$fisierul_modificat    = "$directorul_fisierului_modificat\$fisierul_fara_extensie.rst"
$directorul_scriptului = Get-Location

Set-Location $directorul_traducerii
git diff --no-index $fisierul_nemodificat $fisierul_modificat
Set-Location $directorul_scriptului
Set-ExecutionPolicy Restricted
