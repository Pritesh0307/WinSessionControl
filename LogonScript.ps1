Import-Module BurntToast

$logPath = "C:\SessionControl\SessionLog.txt"
Add-Content -Path $logPath -Value "$(Get-Date): $env:USERNAME logged in"

$logoutTime = (Get-Date).AddHours(1)
$taskName = "AutoLogout_$env:USERNAME"

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "C:\SessionControl\ForceLogout.ps1"
$trigger = New-ScheduledTaskTrigger -Once -At $logoutTime
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -User "SYSTEM" -Force

for ($i = 5; $i -ge 1; $i--) {
    $warnTime = $logoutTime.AddMinutes(-1 * $i)
    $toastScript = "Import-Module BurntToast; New-BurntToastNotification -Text 'Auto Logout Warning', 'You will be logged out in $i minute(s). Please save your work.'"
    $warnTaskName = "ToastWarn_$i"

    $warnAction = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command `$toastScript"
    $warnTrigger = New-ScheduledTaskTrigger -Once -At $warnTime
    Register-ScheduledTask -Action $warnAction -Trigger $warnTrigger -TaskName $warnTaskName -User $env:USERNAME -Force
}

