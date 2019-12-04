Option Compare Database

Public Function LogError(ByVal lngErrNumber As Long, ByVal strErrDescription As String, ByVal strCallingProc As String, Optional ByVal vParameters, Optional ByVal bShowUser As Boolean = True) As Boolean
'------------------------------------------
'Author : Tom Pettit
'Web    : https://www.msaccess.guru/
'------------------------------------------
'Usage  : You are granted permission to use and modify this code freely for your
'       : applications. Please retain this notice in the code
'------------------------------------------
            
On Error GoTo Err_LogError

    ' Logs provided error details to the Error table
    ' Optionally displays error to the user

    Application.Echo True

    Dim strMsg As String      ' String for display in MsgBox
    Dim rst As DAO.RecordSet  ' The tLogError table

    If bShowUser Then
        strMsg = "Error " & lngErrNumber & ": " & strErrDescription
        MsgBox strMsg, vbExclamation, strCallingProc
    End If
    Set rst = CurrentDb.OpenRecordset("ErrorLog", , dbAppendOnly)
    rst.AddNew
        rst![ErrNumber] = lngErrNumber
        rst![ErrDescription] = Left$(strErrDescription, 255)
        rst![ErrDate] = Now()
        rst![CallingProc] = strCallingProc
        rst![UserName] = Environ("Username")
        rst![ShowUser] = bShowUser
        If Not IsMissing(vParameters) Then
            rst![Parameters] = Left(vParameters, 255)
        End If
    rst.Update
    rst.Close
    LogError = True
       

Exit_LogError:
    Set rst = Nothing
    Exit Function



Err_LogError:
    strMsg = "An unexpected situation arose in your program." & vbCrLf & "Please write down the following details:" & vbCrLf & vbCrLf
    strMsg = strMsg & "Calling Proc: " & strCallingProc & vbCrLf & "Error Number " & lngErrNumber & vbCrLf & strErrDescription & vbCrLf & vbCrLf & "Unable to record this error." & vbCrLf & "Reason: " & Err.Number & vbCrLf & Err.Description & vbCrLf & vbCrLf
    strMsg = strMsg & "Paramater: " & vParameters
    MsgBox strMsg, vbCritical, "LogError()"
    Resume Exit_LogError
    Resume
End Function

