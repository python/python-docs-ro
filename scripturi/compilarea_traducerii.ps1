$director_convenabil = "C:\octavian\invatare_Python_2025\traducerea_documentatiei\proiectul_traducerii"
$proiectul           = "$director_convenabil\Python-3.13.3\Doc"
$doctree             = "$proiectul\build\doctrees"
$sursa               = $proiectul
$tinta               = "$proiectul\build"
$executabilul        = "C:\octavian\instalare_python\instalat\Scripts\sphinx-build.exe"
$argumentele         = " -M html -d $doctree $sursa $tinta"
$director_script     = Get-Location

Set-Location $sursa
Start-Process -FilePath $executabilul -ArgumentList $argumentele -NoNewWindow -Wait
Set-Location $director_script
Set-ExecutionPolicy Restricted

              
