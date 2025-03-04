$proiectul    = "C:\octavian\invatare_Python_2025\traducerea_documentatiei\proiectul_traducerii\Python-3.13.2\Doc"
$doctree      = "$proiectul\build\doctrees"
$sursa        = $proiectul
$tinta        = "$proiectul\build"
$executabilul = "C:\octavian\instalare_python\instalat\Scripts\sphinx-build.exe"
$argumentele  = " -M html -d $doctree $sursa $tinta"

cd $sursa
Start-Process -FilePath $executabilul -ArgumentList $argumentele -NoNewWindow
Set-ExecutionPolicy Restricted

              
