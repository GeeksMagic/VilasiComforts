Imports System.Collections.Generic
Imports System.Configuration
Imports System.Linq
Imports System.Security.Cryptography
Imports System.Text
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports MySql.Data.MySqlClient
Imports VilasiComforts.BusinessLayer

Public Class BookRoom
    Inherits System.Web.UI.Page

    'Dim constr As String = ConfigurationManager.ConnectionStrings("VilasiDB").ConnectionString
    'Dim con As New MySqlConnection(constr)
    'Dim cmd As New MySqlCommand

    'Dim totalAmt As String
    Public action1 As String = String.Empty
    Public hash1 As String = String.Empty
    Public txnid1 As String = String.Empty

    Dim objBookRoom As New BookRoomService

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CalendarExtenderCheckIn.StartDate = DateTime.Now
        CalendarExtenderCheckOut.StartDate = DateTime.Now

        Try

            'set merchant key from web.config or AppSettings
            key.Value = ConfigurationManager.AppSettings("MERCHANT_KEY")

            'If Not IsPostBack Then
            '    ' error form
            '    'frmError.Visible = False
            '    'frmError.Visible = true;
            'Else
            'End If
            If String.IsNullOrEmpty(Request.Form("hash")) Then
                BtnPay.Visible = True
            Else
                BtnPay.Visible = False

            End If
        Catch ex As Exception

            Response.Write("<span style='color:red'>" + ex.Message + "</span>")
        End Try


        If Not IsPostBack Then
            Try
                getRoomList()
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry something went wrong!!');", True)
            End Try
            Dim roomType As Integer = Request.QueryString("Roomtype")
            Dim checkIn As String = Request.QueryString("CheckIn")
            Dim checkOut As String = Request.QueryString("CheckOut")
            Dim adults As String = Request.QueryString("Adults")
            Dim currentDte As DateTime = DateTime.Now
            TxtCheckIn.Text = currentDte.ToString("MM/dd/yyyy")
            TxtCheckOut.Text = currentDte.ToString("MM/dd/yyyy")
            TxtCheckIn.Text = checkIn
            TxtCheckOut.Text = checkOut
            DdlRoomType.SelectedValue = roomType
            'TxtAdults.Text = adults

            ' TotalAmt()
        End If
    End Sub

    Protected Sub DdlRoomType_SelectedIndexChanged(sender As Object, e As EventArgs)
        DdlNomOfRooms.Items.Clear()
        'DdlAdults.Items.Clear()
        Select Case DdlRoomType.SelectedValue
            Case 1250
                Dim numofRooms1250 = New List(Of Integer)() From {1, 2, 3, 4}
                For Each num In numofRooms1250
                    DdlNomOfRooms.Items.Add(num)
                Next
                'Dim AdultRooms1250 = New List(Of Integer)() From {1, 2}
                'For Each num In AdultRooms1250
                '    DdlAdults.Items.Add(num)
                'Next
            Case 900
                Dim numofRooms900 = New List(Of Integer)() From {1, 2}
                For Each num In numofRooms900
                    DdlNomOfRooms.Items.Add(num)
                Next
                'Dim adultsRooms900 = New List(Of Integer)() From {1}
                'For Each num In adultsRooms900
                '    DdlAdults.Items.Add(num)
                'Next
            Case 1990
                Dim numofRooms1990 = New List(Of Integer)() From {1, 2, 3, 4, 5, 6}
                For Each num In numofRooms1990
                    DdlNomOfRooms.Items.Add(num)
                Next
                'Dim adultsRooms1990 = New List(Of Integer)() From {1, 2}
                'For Each num In adultsRooms1990
                '    DdlAdults.Items.Add(num)
                'Next
            Case 3000
                Dim numofRooms3000 = New List(Of Integer)() From {1, 2}
                For Each num In numofRooms3000
                    DdlNomOfRooms.Items.Add(num)
                Next
                'Dim adultsRooms3000 = New List(Of Integer)() From {1, 2, 3, 4, 5}
                'For Each num In adultsRooms3000
                '    DdlAdults.Items.Add(num)
                'Next
            Case Else
                DdlNomOfRooms.Items.Add("--Select Room Type First--")
        End Select
        TotalAmt()
    End Sub

    Public Sub DdlNomOfRooms_SelectedIndexChanged(sender As Object, e As EventArgs)
        'DdlAdults.Items.Clear()
        'For Each room In DdlNomOfRooms.SelectedValue
        '    Dim adult As Integer = Convert.ToInt32(room) * 2
        '    DdlAdults.Items.Add(adult)
        'Next
        TotalAmt()
    End Sub

    Sub TotalAmt()
        LblAmount.Text = "0"
        If TxtCheckIn.Text <> "" AndAlso TxtCheckOut.Text <> "" Then
            Dim dt1 As DateTime = Convert.ToDateTime(TxtCheckIn.Text)

            Dim dt2 As DateTime = Convert.ToDateTime(TxtCheckOut.Text)

            Dim ts As TimeSpan = dt2.Subtract(dt1)
            If DdlRoomType.SelectedValue = "0" Then
                LblAmount.Text = "0.00"
            Else
                'If TxtCheckIn.Text <> "" AndAlso TxtCheckOut.Text <> "" Then
                '    Dim numofDays As String = (Convert.ToDateTime(TxtCheckOut.Text) - Convert.ToDateTime(TxtCheckIn.Text)).ToString
                '    LblAmount.Text = DdlNomOfRooms.SelectedValue * DdlRoomType.SelectedValue * numofDays
                'Else
                LblAmount.Text = DdlNomOfRooms.SelectedValue * DdlRoomType.SelectedValue * (Convert.ToInt32(ts.Days) + 1)
                'End If
            End If
        End If

    End Sub

    Private Sub BtnBook_Click(sender As Object, e As EventArgs) Handles BtnBook.Click
        PnlBookingInformation.Visible = False
        PnlGuestInfo.Visible = True
        LblCheckIn.Text = TxtCheckIn.Text
        LblCheckOut.Text = TxtCheckOut.Text
        LblRoomType.Text = DdlRoomType.SelectedItem.Text
        LblNumAdults.Text = TxtAdults.Text
        LblNumChilds.Text = TxtChildrens.Text
        LblNumRooms.Text = DdlNomOfRooms.SelectedValue
        LblPayAmount.Text = LblAmount.Text
    End Sub

    Private Sub LbtEditRoomDetailsForm_Click(sender As Object, e As EventArgs) Handles LbtEditRoomDetailsForm.Click
        PnlGuestInfo.Visible = False
        PnlBookingInformation.Visible = True
        TxtCheckIn.Text = LblCheckIn.Text
        TxtCheckOut.Text = LblCheckOut.Text
        DdlRoomType.SelectedItem.Text = LblRoomType.Text
        TxtAdults.Text = LblNumAdults.Text
        TxtChildrens.Text = LblNumChilds.Text
        DdlNomOfRooms.SelectedValue = LblNumRooms.Text
    End Sub

    Private Sub LbtEditRoomDetails_Click(sender As Object, e As EventArgs) Handles LbtEditRoomDetails.Click
        PnlReport.Visible = False
        PnlBookingInformation.Visible = True
        TxtCheckIn.Text = LblCheckIn.Text
        TxtCheckOut.Text = LblCheckOut.Text
        DdlRoomType.SelectedItem.Text = LblRoomType.Text
        TxtAdults.Text = LblNumAdults.Text
        TxtChildrens.Text = LblNumChilds.Text
        DdlNomOfRooms.SelectedValue = LblNumRooms.Text
    End Sub

    Private Sub LbtEditFormDetails_Click(sender As Object, e As EventArgs) Handles LbtEditFormDetails.Click
        PnlReport.Visible = False
        PnlGuestInfo.Visible = True
        TxtFirstName.Text = LblGuestName.Text
        TxtEmail.Text = LblGuestEmail.Text
        TxtMobile.Text = Replace(LblGuestMobile.Text, "+91", "")
        TxtCity.Text = LblGuestCity1.Text
        TxtZip.Text = LblGuestZip.Text
        TxtAddress.Text = LblGuestAddress.Text
        TxtRequest.Text = LblSpclRequirements.Text
        ChkAgree.Checked = True
    End Sub

    Private Sub BtnConfirm_Click(sender As Object, e As EventArgs) Handles BtnConfirm.Click
        If ChkAgree.Checked = True Then
            PnlBookingInformation.Visible = False
            PnlGuestInfo.Visible = False
            PnlReport.Visible = True
            LblGuestName.Text = TxtFirstName.Text + " " + TxtLastName.Text
            firstname.Text = TxtFirstName.Text + " " + TxtLastName.Text
            LblGuestMobile.Text = "+91" & TxtMobile.Text
            phone.Text = TxtMobile.Text
            LblGuestEmail.Text = TxtEmail.Text
            email.Text = TxtEmail.Text
            LblGuestCity1.Text = TxtCity.Text
            LblGuestAddress.Text = TxtAddress.Text
            LblGuestZip.Text = TxtZip.Text
            LblGuestCheckIn.Text = LblCheckIn.Text
            LblGuestCheckOut.Text = LblCheckOut.Text
            LblGuestRoomType.Text = LblRoomType.Text
            LblGuestNumOfRooms.Text = LblNumRooms.Text
            LblGuestAdults.Text = LblNumAdults.Text
            LblGuestChildrens.Text = LblNumChilds.Text
            LblGuestAmount.Text = LblAmount.Text
            'amount.Text = LblAmount.Text
            amount.Text = "1"
            LblSpclRequirements.Text = TxtRequest.Text
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Please Agree with the Terms & Conditions of Vilasi!!!!');", True)
        End If

    End Sub

    Private Sub BtnCancel_Click(sender As Object, e As EventArgs) Handles BtnCancel.Click
        PnlBookingInformation.Visible = True
        PnlGuestInfo.Visible = False
        PnlReport.Visible = False
    End Sub


    Protected Sub TxtCheckIn_TextChanged(sender As Object, e As EventArgs)
        TotalAmt()
    End Sub

    Protected Sub TxtCheckOut_TextChanged(sender As Object, e As EventArgs)
        TotalAmt()
    End Sub

    Private Sub BtnPay_Click(sender As Object, e As EventArgs) Handles BtnPay.Click
        Try

            Dim hashVarsSeq As String()
            Dim hash_string As String = String.Empty


            If String.IsNullOrEmpty(Request.Form("txnid")) Then
                ' generating txnid
                Dim rnd As New Random()
                Dim strHash As String = Generatehash512(rnd.ToString() & DateTime.Now)

                txnid1 = strHash.ToString().Substring(0, 20)
            Else
                txnid1 = Request.Form("txnid")
            End If
            If String.IsNullOrEmpty(Request.Form("hash")) Then
                ' generating hash value
                If String.IsNullOrEmpty(ConfigurationManager.AppSettings("MERCHANT_KEY")) OrElse
                    String.IsNullOrEmpty(txnid1) OrElse
                    String.IsNullOrEmpty(Request.Form("ctl00$ContentPlaceHolder1$amount")) OrElse
                    String.IsNullOrEmpty(Request.Form("ctl00$ContentPlaceHolder1$firstname")) OrElse
                    String.IsNullOrEmpty(Request.Form("ctl00$ContentPlaceHolder1$email")) OrElse
                    String.IsNullOrEmpty(Request.Form("ctl00$ContentPlaceHolder1$phone")) OrElse
                    String.IsNullOrEmpty(Request.Form("ctl00$ContentPlaceHolder1$productinfo")) OrElse
                    String.IsNullOrEmpty(Request.Form("ctl00$ContentPlaceHolder1$surl")) OrElse
                    String.IsNullOrEmpty(Request.Form("ctl00$ContentPlaceHolder1$furl")) OrElse
                    String.IsNullOrEmpty(Request.Form("ctl00$ContentPlaceHolder1$service_provider")) Then
                    'error

                    'frmError.Visible = True
                    Return
                Else

                    'frmError.Visible = False
                    hashVarsSeq = ConfigurationManager.AppSettings("hashSequence").Split("|"c)
                    ' spliting hash sequence from config
                    hash_string = ""
                    For Each hash_var As String In hashVarsSeq
                        If hash_var = "key" Then
                            hash_string = hash_string + ConfigurationManager.AppSettings("MERCHANT_KEY")
                            hash_string = hash_string & "|"c
                        ElseIf hash_var = "txnid" Then
                            hash_string = hash_string & txnid1
                            hash_string = hash_string & "|"c
                        ElseIf hash_var = "amount" Then
                            hash_string = hash_string & amount.Text
                            hash_string = hash_string & "|"c
                        Else

                            hash_string = hash_string & (If(Request.Form("ctl00$ContentPlaceHolder1$" + hash_var) IsNot Nothing, Request.Form("ctl00$ContentPlaceHolder1$" + hash_var), ""))
                            ' isset if else
                            hash_string = hash_string & "|"c
                        End If
                    Next

                    hash_string += ConfigurationManager.AppSettings("SALT")
                    ' appending SALT
                    hash1 = Generatehash512(hash_string).ToLower()
                    'generating hash
                    ' setting URL
                    action1 = ConfigurationManager.AppSettings("PAYU_BASE_URL") + "/_payment"


                End If

            ElseIf Not String.IsNullOrEmpty(Request.Form("hash")) Then
                hash1 = Request.Form("hash")

                action1 = ConfigurationManager.AppSettings("PAYU_BASE_URL") + "/_payment"
            End If




            If Not String.IsNullOrEmpty(hash1) Then
                hash.Value = hash1
                txnid.Value = txnid1

                Dim data As New System.Collections.Hashtable()
                ' adding values in gash table for data post
                data.Add("hash", hash.Value)
                data.Add("txnid", txnid.Value)
                data.Add("key", key.Value)
                Dim AmountForm As String = Convert.ToDecimal(amount.Text.Trim()).ToString("g29")
                ' eliminating trailing zeros
                amount.Text = AmountForm
                data.Add("amount", AmountForm)
                data.Add("firstname", firstname.Text.Trim())
                data.Add("email", email.Text.Trim())
                data.Add("phone", phone.Text.Trim())
                data.Add("productinfo", productinfo.Text.Trim())
                data.Add("surl", surl.Text.Trim())
                data.Add("furl", furl.Text.Trim())
                data.Add("lastname", "")
                data.Add("curl", "")
                data.Add("address1", LblGuestAddress.Text)
                data.Add("address2", "")
                data.Add("city", LblGuestCity1.Text)
                data.Add("state", "")
                data.Add("country", "")
                data.Add("zipcode", LblGuestZip.Text)
                data.Add("udf1", "")
                data.Add("udf2", "")
                data.Add("udf3", "")
                data.Add("udf4", "")
                data.Add("udf5", "")
                data.Add("pg", "")
                data.Add("service_provider", service_provider.Text.Trim())
                Dim strForm As String = PreparePOSTForm(action1, data)
                Page.Controls.Add(New LiteralControl(strForm))
            Else
                'no hash
            End If

        Catch ex As Exception


            Response.Write("<span style='color:red'>" & ex.Message & "</span>")
        End Try

        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry!! Service comimg soon');", True)
    End Sub

    Public Function Generatehash512(ByVal text As String) As String
        Dim message As Byte() = Encoding.UTF8.GetBytes(text)
        Dim UE As New UnicodeEncoding()
        Dim hashValue As Byte()
        Dim hashString As New SHA512Managed()
        Dim hex As String = ""
        hashValue = hashString.ComputeHash(message)
        For Each x As Byte In hashValue
            hex += [String].Format("{0:x2}", x)
        Next
        Return hex
    End Function

    Private Function PreparePOSTForm(ByVal url As String, ByVal data As System.Collections.Hashtable) As String
        ' post form
        'Set a name for the form
        Dim formID As String = "PostForm"
        'Build the form using the specified data to be posted.
        Dim strForm As New StringBuilder()
        strForm.Append("<form id=""" & formID & """ name=""" & formID & """ action=""" & url & """ method=""POST"">")

        For Each key As System.Collections.DictionaryEntry In data

            strForm.Append("<input type=""hidden"" name=""" & Convert.ToString(key.Key) & """ value=""" & Convert.ToString(key.Value) & """>")
        Next
        strForm.Append("</form>")
        'Build the JavaScript which will do the Posting operation.
        Dim strScript As New StringBuilder()
        strScript.Append("<script language='javascript'>")
        strScript.Append("var v" & formID & " = document." & formID & ";")
        strScript.Append("v" & formID & ".submit();")
        strScript.Append("</script>")
        'Return the form and the script concatenated.
        '(The order is important, Form then JavaScript)
        Return strForm.ToString() & strScript.ToString()
    End Function

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