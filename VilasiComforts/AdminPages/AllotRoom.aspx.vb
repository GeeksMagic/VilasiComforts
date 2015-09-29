Imports VilasiComforts.BusinessLayer

Public Class AllotRoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Dim objAllotRoom As New AllotRoomService

    Private Sub BtnCheck_Click(sender As Object, e As EventArgs) Handles BtnCheck.Click
        Try
            Dim customerDetails As DataTable = objAllotRoom.getCustomerDetails(TxtBookingNumber.Text)
            If customerDetails.Rows.Count > 0 Then
                PnlCustomers.Visible = True
                LblName.Text = customerDetails.Rows(0)("Full_Name").ToString()
                LblMobile.Text = customerDetails.Rows(0)("Phone").ToString
                LblMail.Text = customerDetails.Rows(0)("EMail").ToString
                LblAddress.Text = customerDetails.Rows(0)("Address").ToString
                LblAdult.Text = customerDetails.Rows(0)("Adult_Count").ToString
                LblChild.Text = customerDetails.Rows(0)("Child_Count").ToString
                LblRoomType.Text = customerDetails.Rows(0)("RoomType").ToString
                LblCkeckIn.Text = customerDetails.Rows(0)("CheckInDate").ToString
                LblCheckOut.Text = customerDetails.Rows(0)("CheckOutDate").ToString
                LblTotalAmt.Text = customerDetails.Rows(0)("Net_Amount").ToString
            Else
                PnlCustomers.Visible = False
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('No Data Available for the Booking Id!!');", True)
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
        End Try
    End Sub
End Class