Write-host("
Enter the full path of a CSV file containing a list of user first and last names.") -ForegroundColor Cyan
$namesList = read-host("Choose file")
$UserList = Get-Content $namesList

Write-Host("
Preparing Organizational Unit...") -ForegroundColor Cyan
$Password = ConvertTo-SecureString "DefaultPass1" -AsPlainText -Force
$OU_Name = read-host("Name for user OU")

Write-Host("
Creating Organizational Unit...") -ForegroundColor Cyan

Write-Host("Default user password: DefaultPass1")

New-ADOrganizationalUnit -Name $OU_Name -ProtectedFromAccidentalDeletion $false

foreach ($user in $UserList) {
    $FName = "$($user.Split(",")[0][0])".ToUpper() + "$($user.Split(",")[0])".Substring(1,$($user.Split(",")[0]).Length-1).ToLower()
    $LName = "$($user.Split(",")[1][0])".ToUpper() + "$($user.Split(",")[1])".Substring(1,$($user.Split(",")[1]).Length-1).ToLower()
    $UName = "$($FName[0])$($LName)".ToLower().Trim()

    New-AdUser `
        -AccountPassword $Password `
        -GivenName $FName `
        -Surname $LName `
        -DisplayName $UName `
        -Name $UName `
        -EmployeeID $UName `
        -PasswordNeverExpires $true `
        -Path "OU=$OU_Name,$(([ADSI]`"").distinguishedName)" `
        -Enabled $true
}

Write-Host("
Organizational Unit '$($OU_Name)' successfully created.") -ForegroundColor Cyan