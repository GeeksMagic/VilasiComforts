Imports VilasiComforts.BusinessLayer

Public Class VilasiAdmin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim a As String = Session("Name").ToString
            'Session("Id") = Request.QueryString("Id")
            If Not IsPostBack Then
                If Session("Name") IsNot Nothing Then
                    LblUserName.Text = Session("Name").ToString
                Else
                    Response.Redirect(FormsAuthentication.LoginUrl)
                End If
            End If
        Catch ex As Exception
            Response.Redirect(FormsAuthentication.LoginUrl)
        End Try
    End Sub

End Class