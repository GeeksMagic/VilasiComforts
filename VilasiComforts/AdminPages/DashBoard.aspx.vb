Imports VilasiComforts.BusinessLayer
Imports VilasiComforts.Model

Public Class DashBoard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim todayDate As DateTime = DateTime.Now
        CalendarExtenderCheckIn.StartDate = todayDate
        CalendarExtenderReservedCheckOutDate.StartDate = todayDate.AddDays(1)
        If Not IsPostBack Then
            ContactList()
            getRoomList()
            GuestList()
            getRoomCount()
            getRoomNumber()
            getGuestCount()
        End If
    End Sub

    Dim ObjDashBoard As New DashBoardService
    Dim objBookRoom As New BookRoomService

    Sub ContactList()
        Try
            Dim ds As New DataSet
            ds = ObjDashBoard.getRoomList
            grvContact.DataSource = ds
            grvContact.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub

    Sub getRoomList()
        Try
            Dim rooms As DataSet = objBookRoom.getRoomList()
            DdlReservedRoomType.Items.Clear()
            DdlReservedRoomType.DataSource = rooms
            DdlReservedRoomType.DataTextField = "RoomType"
            DdlReservedRoomType.DataValueField = "Rent"
            DdlReservedRoomType.DataBind()
            DdlRoomTypePriceUpdate.Items.Clear()
            DdlRoomTypePriceUpdate.DataSource = rooms
            DdlRoomTypePriceUpdate.DataTextField = "RoomType"
            DdlRoomTypePriceUpdate.DataValueField = "Rent"
            DdlRoomTypePriceUpdate.DataBind()
            DdlBlockRoomType.Items.Clear()
            DdlBlockRoomType.DataSource = rooms
            DdlBlockRoomType.DataTextField = "RoomType"
            DdlBlockRoomType.DataValueField = "Rent"
            DdlBlockRoomType.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub

    Sub GuestList()
        Try
            Dim checkinDate As DateTime
            If TxtCheckIn.Text <> "" Then
                checkinDate = Convert.ToDateTime(TxtCheckIn.Text)
            Else
                checkinDate = "1900/01/01"
            End If

            Dim customer As New DataTable
            customer = ObjDashBoard.getCustomer(TxtCustomerId.Text, checkinDate, DdlRoomNumber.SelectedValue)
            grvGuest.DataSource = customer
            grvGuest.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub

    Sub getRoomCount()
        Try
            Dim roomcount As New DataTable
            roomcount = ObjDashBoard.getRoomCount
            If roomcount.Rows.Count > 0 Then
                LblNumSuitRooms.Text = roomcount.Rows(0)("Suit").ToString()
                LblNumACDoubleRoom.Text = roomcount.Rows(0)("AC-Double").ToString()
                LblNumNonACDoubleRooms.Text = roomcount.Rows(0)("Non-AC-Double").ToString()
                'LblNumNonACSingleRooms.Text = roomcount.Rows(0)("Non-AC_Single").ToString()
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub

    Sub getGuestCount()
        Try
            Dim guestCount As New DataTable
            guestCount = ObjDashBoard.getGuestCount()
            If guestCount.Rows.Count > 0 Then
                LblTotalGuest.Text = guestCount.Rows(0)("TotalGuest").ToString()
                LblMonthGuest.Text = guestCount.Rows(0)("MonthGuest").ToString()
                LblTodayGuest.Text = guestCount.Rows(0)("TodayGuest").ToString()
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub

    Sub getRoomNumber()
        Try
            Dim rooms As DataTable = ObjDashBoard.getRoomNumber()
            DdlRoomNumber.DataSource = rooms
            DdlRoomNumber.DataTextField = "RoomNumber"
            DdlRoomNumber.DataValueField = "RoomNumber"
            DdlRoomNumber.DataBind()
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub

    Protected Sub grvContact_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        grvContact.PageIndex = e.NewPageIndex
        Me.ContactList()
    End Sub

    Protected Sub grvGuest_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        grvGuest.PageIndex = e.NewPageIndex
        Me.GuestList()
    End Sub

    Private Sub BtnSearch_Click(sender As Object, e As EventArgs) Handles BtnSearch.Click
        GuestList()
    End Sub

    Private Sub DdlRoomTypePriceUpdate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlRoomTypePriceUpdate.SelectedIndexChanged
        TxtPriceUpdate.Text = DdlRoomTypePriceUpdate.SelectedValue
    End Sub

    Private Sub BtnUpdate_Click(sender As Object, e As EventArgs) Handles BtnUpdate.Click
        If ObjDashBoard.updatePrice(TxtPriceUpdate.Text, DdlRoomTypePriceUpdate.SelectedItem.Text) Then
            TxtPriceUpdate.Text = String.Empty
            'DdlRoomTypePriceUpdate.Items.FindByValue(0).Selected = True
            getRoomList()
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Rate is Updated for" + DdlRoomTypePriceUpdate.SelectedItem.Text + "');", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Rate is Not Updated');", True)
        End If
    End Sub

    Private Sub BtnReserve_Click(sender As Object, e As EventArgs) Handles BtnReserve.Click
        Dim bookingId As String = "Res" + Date.Now.ToString("ddMMyyyy") + (objBookRoom.getBookingId()).ToString
        Dim room As DataSet = objBookRoom.checkRoom(TxtReservedDate.Text, DdlReservedRoomType.SelectedItem.Text, DdlReservedRoomType.SelectedValue)
        Dim roomId As String = String.Empty
        Dim custId As String = "owner" + (objBookRoom.getCustId()).ToString
        Dim checkInDate As String = TxtReservedDate.Text
        Dim checkOutDate As String = TxtReservedCheckOut.Text
        Dim customerName As String = TxtReservedName.Text
        Dim paidAmount As String = "0"
        If room.Tables(0).Rows.Count > 0 Then
            roomId = room.Tables(0).Rows(0)("RoomId")
        End If
        Dim custmodel As New customerdetails(bookingId, custId, roomId, checkInDate, checkOutDate, customerName, paidAmount)

        If objBookRoom.bookRoom(custmodel) Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Your Room has been booked successfully!!');", True)
        End If
    End Sub

    Private Sub BtnBlock_Click(sender As Object, e As EventArgs) Handles BtnBlock.Click
        If ObjDashBoard.BlockRoom(TxtBlockCheckIn.Text, DdlBlockRoomType.SelectedValue, RblBlock.SelectedValue) Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Selected Room has Been Blocked/Unblocked successfully!!');", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Operation Failed, Try Again!!');", True)
        End If
    End Sub
End Class