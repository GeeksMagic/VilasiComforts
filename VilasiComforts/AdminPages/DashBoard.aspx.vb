Imports VilasiComforts.BusinessLayer

Public Class DashBoard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CalendarExtenderReservedDate.StartDate = DateTime.Now
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
            DdlReservedRoomType.DataSource = rooms
            DdlReservedRoomType.DataTextField = "RoomType"
            DdlReservedRoomType.DataValueField = "Rent"
            DdlReservedRoomType.DataBind()
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
                LblNumNonACSingleRooms.Text = roomcount.Rows(0)("Non-AC_Single").ToString()
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
End Class