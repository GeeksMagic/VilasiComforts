Imports VilasiComforts.BusinessLayer

Public Class Admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        userId.Focus()
    End Sub

    Dim objLogin As New LoginService

    Private Sub BtnLogin_Click(sender As Object, e As EventArgs) Handles BtnLogin.Click
        Try
            Dim login As Boolean = objLogin.LoginDetails(userId.Text.ToLower, Password.Text.ToLower)
            If login Then
                Session.Add("Name", objLogin.LoginName(userId.Text.ToLower))
                Response.Redirect(FormsAuthentication.DefaultUrl, False)
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Invalid User Name or password!!');", True)
                Password.Text = String.Empty
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('" & ex.ToString & "');", True)
            Password.Text = String.Empty
        End Try
    End Sub
End Class