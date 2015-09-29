Public Class LogOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Abandon()
        Session.Clear()
        Session.RemoveAll()
        Session("Name") = Nothing
        FormsAuthentication.SignOut()
        Response.Redirect("Admin.aspx")
    End Sub

End Class