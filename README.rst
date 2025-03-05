O traducere în românește a documentației limbajului Python
==========================================================

Traducerea se realizează pe fragmente de text numite **mesaje**.
Aceste mesaje se găsesc/introduc în fișiere
`PO <https://www.gnu.org/software/gettext/manual/html_node/PO-Files.html>`_.

Fișierele PO pot fi generate, dacă lucrăm sub sistemul de 
operare Microsoft **Windows 11**, într-un cont de **administrator**, 
astfel:

- instalăm cea mai recentă versiune **stabilă** de 
  `Python <https://www.python.org/>`_;
- instalăm generatorul de documentație 
  `Sphinx <https://www.sphinx-doc.org/en/master/usage/installation.html>`_;
- instalăm unealta
  `sphinx-intl <https://www.sphinx-doc.org/en/master/usage/advanced/intl.html>`_;
- descărcăm într-un director convenabil codul-sursă al celei mai recente
  versiuni **stabile** de Python (aceeași ca mai sus); de exemplu, 
  `3.13.2 <https://www.python.org/downloads/source/>`_;
- în subdirectorul **Doc** al codului-sursă Python se găsește fișierul
  **conf.py**, la sfârșitul căruia adăugăm

  ::

     # Optiuni pentru traducerea in romaneste
     # Adaugat in [ 03.03.2025 ]
     # Conform [ https://www.sphinx-doc.org/en/master/usage/advanced/intl.html ]
     # -------------------------------------------------------------------------

     locale_dirs = ['locale/']   # path is example but recommended.
     gettext_compact = False     # optional.
     language = 'ro'

- din subdirectorul **Doc**, deschidem un 
  `terminal Windows <https://learn.microsoft.com/en-us/windows/terminal/>`_
  și executăm comanda

  ::

     ./make gettext

  Ea va genera subdirectorul **build/gettext** al directorului **Doc**, 
  care conține fișiere
  `POT <https://www.drupal.org/community/contributor-guide/reference-information/localize-drupal-org/working-with-offline/po-and-pot-files>`_.

- în același terminal, comanda

  ::

     sphinx-intl update -p build/gettext -l ro

  va produce subdirectorul **locale/ro/LC_MESSAGES** al directorului
  **Doc**. Acesta conține fișierele PO căutate.

Putem genera codul HTML al documentației folosind scriptul 
**scripturi/compilarea_traducerii.ps1** din acest proiect. Astfel,
într-un terminal Windows cu **drepturi de administrator**
(tastele Win + X, A), deschis din directorul unde se găsește
scriptul PowerShell, executăm comenzile:

::

    Set-ExecutionPolicy Unrestricted
    ./compilarea_traducerii

Acord asupra contribuției aduse la documentație
-----------------------------------------------

NOTĂ PRIVIND LICENȚA TRADUCERILOR: documentația Python
este întreținută de o rețea globală de voluntari. Prin
publicarea acestui proiect pe Transifex, GitHub sau în
alt loc public și prin invitația adresată dumneavoastră
de a participa la el vă propunem un acord în baza căruia
dumneavoastră vă veți oferi îmbunătățirile aduse 
documentației Python sau traducerii acesteia spre 
folosință de către PSF sub licența CC0 (disponibilă la 
adresa
https://creativecommons.org/publicdomain/zero/1.0/legalcode).
În schimb, veți putea pretinde recunoaștere asupra 
porțiunii din traducere la care ați contribuit și, dacă
traducerea dumneavoastră este acceptată de către PSF, veți
putea (fără a fi obligat la aceasta) să transmiteți o
corecție cuprinzând adnotarea potrivită a fișierului
Misc/ACKS sau TRANSLATORS. Deși nimic din acest acord
asupra contribuției aduse la documentație nu obligă
PSF să încorporeze textul contribuției dumneavoastră,
participarea dumneavoastră la comunitatea Python este
binevenită și apreciată.

Consfințiți acceptarea acestui acord prin transmiterea
muncii dumneavoastră către PSF pentru a fi inclusă în
documentație.



