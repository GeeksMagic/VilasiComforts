Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Public Class VIlasi
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Name") = String.Empty
    End Sub

End Class