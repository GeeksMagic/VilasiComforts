Imports System
Imports System.Web
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

Public Class LoginDAL

    Dim constr As String = ConfigurationManager.ConnectionStrings("VilasiComforts").ConnectionString
    'Dim con As New MySqlConnection(constr)
    Dim con As SqlConnection = New SqlConnection(constr)

    Public Function LoginDetail(ByVal id As String, ByVal password As String) As Boolean
        Dim cmd As New SqlCommand("select count(*) from Admin where UserId='" & id & "' and Password='" & password & "';", con)
        cmd.CommandType = CommandType.Text
        con.Open()
        If cmd.ExecuteScalar.Equals(1) Then
            cmd.Dispose()
            con.Close()
            Return True
        Else
            cmd.Dispose()
            con.Close()
            Return False
        End If
    End Function

    Public Function LoginName(ByVal id As String) As String
        Dim cmd As New SqlCommand("select UserName from Admin where UserId='" & Id & "';", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        con.Open()
        Dim name As String = cmd.ExecuteScalar()
        cmd.Dispose()
        con.Close()
        Return name
    End Function


End Class
