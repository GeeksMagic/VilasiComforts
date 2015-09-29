Imports VilasiComforts.BusinessLayer

Public Class AsignRoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CalendarExtenderCheckIn.StartDate = DateTime.Now
        CalendarExtenderCheckOut.StartDate = DateTime.Now
        If Not IsPostBack Then
            LblDate.Text = Date.Today.ToString("MM-dd-yyyy")
            getRoomList()
        End If
    End Sub

    Dim objBookRoom As New BookRoomService
    Sub getRoomList()
        Try
            Dim rooms As DataSet = objBookRoom.getRoomList()
            DdlReservedRoomType.DataSource = rooms
            DdlReservedRoomType.DataTextField = "RoomType"
            DdlReservedRoomType.DataValueField = "Rent"
            DdlReservedRoomType.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub

End Class