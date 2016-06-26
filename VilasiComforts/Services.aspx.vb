Imports VilasiComforts.BusinessLayer

Public Class Services
    Inherits System.Web.UI.Page

    Dim objBookRoom As New BookRoomService

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            bindRoomDetails()
        End If
    End Sub

    Private Sub bindRoomDetails()
        Dim roomdetails As DataSet = objBookRoom.getRooms()
        LblNonAc.Text = roomdetails.Tables(0).Rows(3)("RoomType")
        LblNonAcPrice.Text = roomdetails.Tables(0).Rows(3)("Rent")
        LblAcDouble.Text = roomdetails.Tables(0).Rows(0)("RoomType")
        LblAcDoublePrice.Text = roomdetails.Tables(0).Rows(0)("Rent")
        LblSuit.Text = roomdetails.Tables(0).Rows(4)("RoomType")
        LblSuitPrice.Text = roomdetails.Tables(0).Rows(4)("Rent")
        LblExtraBed.Text = roomdetails.Tables(0).Rows(1)("RoomType")
        LblExtraBedPrice.Text = roomdetails.Tables(0).Rows(1)("Rent")
        LblExtraPerson.Text = roomdetails.Tables(0).Rows(2)("RoomType")
        LblExtraPersonPrice.Text = roomdetails.Tables(0).Rows(2)("Rent")
    End Sub

End Class