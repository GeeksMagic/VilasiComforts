Imports MySql.Data.MySqlClient
Imports System.Data.SqlClient


Public Class ContactDAL

    Dim constr As String = ConfigurationManager.ConnectionStrings("VilasiComforts").ConnectionString
    'Dim con As New MySqlConnection(constr)
    Dim con As SqlConnection = New SqlConnection(constr)

    Public Function UpdtContactDetail(ByVal name As String, ByVal email As String, ByVal phone As String, ByVal msg As String) As Boolean
        'Dim cmd As New MySqlCommand("insert into Contact(CONTACT_NAME,CONTACT_EMAIL,CONTACT_MOBILE,CONTACT_MESSAGE) values ('" & name & "','" & email & "','" & phone & "','" & msg & "');", con)
        Dim cmd As New SqlCommand("insert into Contacts(CONTACT_NAME,CONTACT_EMAIL,CONTACT_MOBILE,CONTACT_MESSAGE) values ('" & name & "','" & email & "','" & phone & "','" & msg & "');", con)
        cmd.CommandType = CommandType.Text
        con.Open()
        If cmd.ExecuteNonQuery().Equals(1) Then
            con.Close()
            Return True
        Else
            con.Close()
            Return False
        End If
    End Function

End Class
