param($eventID,$subjectusername,$targetusername,$targetsid,$subjectusersid)

$Mailaddrrec = "emaildestinataire@domaine.fr"
$Mailaddrexp = "emailexpéditeur@domaine.fr"
$smtp = "smtp.domaine.Fr"
$logfil = "C:\Utilitaires\log\outputAD.txt"


### Fonction : ctrl activation d'un utilisteur
function event-activuser ($eventID,$subjectusername,$targetusername)
{
    "EventID: " + $eventID + ", " + $subjectusername + " a activé le compte utilisateur : " + $targetusername + ", a " + (get-date) | out-file $logfil -Append
	Send-MailMessage -to $Mailaddrrec -subject 'Attention : activation de compte utilisateur AD !' -body 'Voir fichier en PJ' -smtpserver $smtp -from $Mailaddrexp -Attachments $logfil
}

### Fonction : ctrl désactivation d'un utilisateur
function event-unactivuser ($eventID,$subjectusername,$targetusername)
{
    "EventID: " + $eventID + ", " + $subjectusername + " a desactive le compte utilisateur : " + $targetusername + ", a " + (get-date) | out-file $logfil -Append
	Send-MailMessage -to $Mailaddrrec -subject 'Attention : desactivation de compte AD !' -body 'Voir fichier en PJ' -smtpserver $smtp -from $Mailaddrexp -Attachments $logfil
}

### Fonction : ctrl compte verrouillé
function event-accountlocked ($eventID,$subjectusername,$targetusername)
{
    "EventID: " + $eventID + ", " + $subjectusername + " a verrouille le compte utilisateur : " + $targetusername + ", a " + (get-date) | out-file $logfil -Append
	Send-MailMessage -to $Mailaddrrec -subject 'Attention : verrouillage de compte AD !' -body 'Voir fichier en PJ' -smtpserver $smtp -from $Mailaddrexp -Attachments $logfil
}

### Fonction ctrl mot de passe réinitialisé
function event-pwdreset ($eventID,$subjectusername,$targetusername)
{
    "EventID: " + $eventID + ", " + $subjectusername + " a reinitialise le mot de passe utilisateur : " + $targetusername + ", a " + (get-date) | out-file $logfil -Append
	Send-MailMessage -to $Mailaddrrec -subject 'Attention : reinitilisation de mot de passe utilisateur AD !' -body 'Voir fichier en PJ' -smtpserver $smtp -from $Mailaddrexp -Attachments $logfil
}

### Fonction ctrl compte supprimé
function event-delaccount ($eventID,$subjectusername,$targetusername)
{
    "EventID: " + $eventID + ", " + $subjectusername + " a supprime le compte utilisateur : " + $targetusername + ", a " + (get-date) | out-file $logfil -Append
	Send-MailMessage -to $Mailaddrrec -subject 'Attention : suppression de compte utilisateur AD !' -body 'Voir fichier en PJ' -smtpserver $smtp -from $Mailaddrexp -Attachments $logfil
}


### Appel des fonctions selon l'event ID MS
if ($eventID -eq 4722)
{
    event-activuser -eventID $eventID -subjectusername $subjectusername -targetusername $targetusername
}
if ($eventID -eq 4740)
{
    event-accountlocked -eventID $eventID -subjectusername $subjectusername -targetusername $targetusername
}
if ($eventID -eq 4724)
{
    event-pwdreset -eventID $eventID -subjectusername $subjectusername -targetusername $targetusername
}
if ($eventID -eq 4726)
{
    event-delaccount -eventID $eventID -subjectusername $subjectusername -targetusername $targetusername
}
if ($eventID -eq 4725)
{
    event-unactivuser -eventID $eventID -subjectusername $subjectusername -targetusername $targetusername
}
