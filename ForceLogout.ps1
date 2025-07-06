shutdown.exe /l /f

$nextLogin = (Get-Date).AddHours(1)
$startHour = $nextLogin.ToString("HH")
$endHour = ($nextLogin.AddHours(1)).ToString("HH")
$day = (Get-Date).DayOfWeek.ToString().Substring(0,1)

$username = "$env:USERNAME"
$timeRestriction = "$day,$startHour:00-$endHour:00"
Invoke-Expression "net user $username /time:$timeRestriction"

Add-Content -Path "C:\SessionControl\SessionLog.txt" -Value "$(Get-Date): $username restricted until $endHour:00"

