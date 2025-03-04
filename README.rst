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

  Ea va genera subdirectorul **build/gettext**, care conține fișiere
  `POT <https://www.drupal.org/community/contributor-guide/reference-information/localize-drupal-org/working-with-offline/po-and-pot-files>`_.

- în același terminal, comanda

  ::

     sphinx-intl update -p build/gettext -l ro

  va produce subdirectorul **locale/ro/LC_MESSAGES**. Acesta conține fișierele
  PO căutate.

Putem genera codul HTML al documentației folosind scriptul 
**compilarea_documentatiei.ps1** din acest proiect. Astfel,
într-un terminal Windows cu **drepturi de administrator**
(tastele Win + X, A), deschis din directorul unde se găsește
scriptul Python, executăm comenzile:

::

    Set-ExecutionPolicy Unrestricted
    ./compilarea_documentatiei



