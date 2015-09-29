Imports VilasiComforts.DataAccessLayer

Public Class ContactService

    Dim objcontact As New ContactDAL

    Public Function UpdtContactDetail(ByVal name As String, ByVal email As String, ByVal phone As String, ByVal msg As String) As Boolean
        Return objcontact.UpdtContactDetail(name, email, phone, msg)
    End Function

End Class