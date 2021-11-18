# BaptADPS
PowerShell AD Active Directory Microsoft Alerte Mail sur modification de compte AD
<hr>
<b>Active Directory :</b>
Si un compte AD est créé/supprimé/verrouillé/mdp changé : alerter un Admin par mail et le loguer dans un fichier. Pratique si vous êtes plusieurs comptes admin, pour être informé. En cas de piratage basique, permet de voir si des opérations sont faites sur les comptes.
<hr>

<b>1</b> - Modifier l'auteur dans les fichiers XML de taches planifiées "Author>XXXX</Author" par "DOMAINE/Username" et modifier également "UserId>XXXX</UserId" par l'UID du compte exécutant la tâche planifiée (le mot de passe sera demandé à l'ajout de la tâche)

<b>2</b> - Modifier dans les fichiers XML de taches planifiées, l'emplacement du script powershell "Arguments>-file [....]"
  
<b>3</b> - Dans le script EventAlert.ps1, modifier les variables par vos informations : $Mailaddrrec $Mailaddrexp $smtp $logfil

<b>4</b> - Déposer le script à l'emplacement que vous avez indiqué à l'étape 2
  
<b>5</b> - Ouvrir le gestionnaire de tâche plannifées, aller dans "\Tâches de l’Observateur d’événements", clic droit, importer les tâches au format XML
  
<b>6</b> - Plus qu'à tester la création, suppression, réinitialisation, d'un compte utilisateur sur l'AD
  
(Forcément, les logs doivent être actives sur le serveur en question)
