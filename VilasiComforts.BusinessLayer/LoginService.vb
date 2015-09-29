Imports VilasiComforts.DataAccessLayer

Public Class LoginService

    Dim ObjLogin As New LoginDAL

    Public Function LoginDetails(ByVal id As String, ByVal password As String) As Boolean
        Return ObjLogin.LoginDetail(id, password)
    End Function

    Public Function LoginName(ByVal id As String) As String
        Return ObjLogin.LoginName(id)
    End Function

End Class
