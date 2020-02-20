## Create new Azure AD User

$firstName = Read-Host -Prompt "Enter new user's first name enclosed in quotes"
$lastName = Read-Host -Prompt "Enter new user's last name enclosed in quotes"
$displayName = $firstName + " " + $lastName
$upn = (Read-Host -Prompt 'Enter the preferred UPN prefix enclosed in quotes. Usually firstinitial+lastname or firstname+lastinitial e.g. "pparker" or "peterp"') + "@tryelevate.com"
$upn = $upnPrefix + "@tryelevate.com"
$temppass = "Elevate2020!"


New-AzureADUser
-DisplayName $displayName
-GivenName $firstName
-Surname $lastName
-UserPrincipalName $upn
-AccountEnabled $true
-PasswordPolicies DisablePasswordExpiration