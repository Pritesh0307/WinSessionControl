Public Class MainForm
    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If txtPassword.Text = "Admin@123" Then
            pnlSettings.Enabled = True
        Else
            MessageBox.Show("Invalid password.")
        End If
    End Sub

    Private Sub btnDeploy_Click(sender As Object, e As EventArgs) Handles btnDeploy.Click
        Dim psi As New ProcessStartInfo()
        psi.FileName = "powershell.exe"
        psi.Arguments = "-ExecutionPolicy Bypass -File C:\SessionControl\LogonScript.ps1"
        psi.Verb = "runas"
        psi.UseShellExecute = True
        Process.Start(psi)
    End Sub
End Class

