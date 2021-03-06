﻿Imports VilasiComforts.BusinessLayer

Public Class Index
    Inherits System.Web.UI.Page

    Dim objBookRoom As New BookRoomService

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CalendarExtenderCheckIn.StartDate = DateTime.Now
        CalendarExtenderCheckOut.StartDate = DateTime.Now
        If Not IsPostBack Then
            Try
                getRoomList()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
            End Try
        End If
    End Sub

    Private Sub BtnCheck_Click(sender As Object, e As EventArgs) Handles BtnCheck.Click
        Dim rooms As DataSet = objBookRoom.checkRoom(TxtCheckIn.Text, DdlRoomType.SelectedItem.Text, DdlRoomType.SelectedValue)
        If rooms.Tables(0).Rows.Count > 0 Then
            Response.Redirect("~/BookRoom.aspx?RoomType=" + DdlRoomType.SelectedValue + "&CheckIn=" + TxtCheckIn.Text + "&CheckOut=" + TxtCheckOut.Text + "&Adults=" + TxtAdults.Text)
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('" + DdlRoomType.SelectedItem.Text + " rooms are not available on " + TxtCheckIn.Text + "');", True)
        End If

    End Sub

    Sub getRoomList()
        Try
            Dim rooms As DataSet = objBookRoom.getRoomList()
            DdlRoomType.DataSource = rooms
            DdlRoomType.DataTextField = "RoomType"
            DdlRoomType.DataValueField = "Rent"
            DdlRoomType.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub
End Class