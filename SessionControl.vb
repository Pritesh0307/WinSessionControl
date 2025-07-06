Imports System.IO

Public Class SessionControl
    Public Shared Sub WriteLog(message As String)
        File.AppendAllText("C:\SessionControl\SessionLog.txt", $"{DateTime.Now}: {message}{Environment.NewLine}")
    End Sub
End Class

