Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Security.Cryptography
Imports System.Text
Imports VilasiComforts.Model
Imports VilasiComforts.BusinessLayer
Imports System.Net.Mail
Imports System.IO
Imports System.Net

Public Class ResponseHandling
    Inherits System.Web.UI.Page

    Dim objBookRoom As New BookRoomService

    Dim custEmail As String = String.Empty
    Dim custName As String = String.Empty
    Dim paidAmount As String = String.Empty
    Dim trnxnId As String = String.Empty
    Dim checkInDate As String = String.Empty
    Dim checkOutDate As String = String.Empty
    Dim adults As String = String.Empty
    Dim childrens As String = String.Empty
    Dim roomType As String = String.Empty
    Dim noOfRooms As String = String.Empty
    Dim mobile As String = String.Empty
    Dim city As String = String.Empty
    Dim zip As String = String.Empty
    Dim custAddress As String = String.Empty
    Dim spclRequest As String = String.Empty
    Dim custId As String = String.Empty
    Dim bookingId As String = String.Empty
    Dim roomId As String = String.Empty

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            Dim merc_hash_vars_seq As String()
            Dim merc_hash_string As String = String.Empty
            Dim merc_hash As String = String.Empty
            Dim order_id As String = String.Empty
            'Dim hash_seq As String = "key|txnid|amount|productinfo|firstname|email|chkin|chkout|adults|children|roomtype|noofrooms|phone|city|zip|address|spclrequest"
            Dim hash_seq As String = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10"

            If Request.Form("status") = "success" Then

                merc_hash_vars_seq = hash_seq.Split("|"c)
                Array.Reverse(merc_hash_vars_seq)
                merc_hash_string = ConfigurationManager.AppSettings("SALT") + "|" & Request.Form("status")


                For Each merc_hash_var As String In merc_hash_vars_seq
                    merc_hash_string += "|"

                    merc_hash_string = merc_hash_string & (If(Request.Form(merc_hash_var) IsNot Nothing, Request.Form(merc_hash_var), ""))

                    Select Case merc_hash_var
                        Case "email"
                            custEmail = Request.Form(merc_hash_var)
                        Case "firstname"
                            custName = Request.Form(merc_hash_var)
                        Case "amount"
                            paidAmount = Request.Form(merc_hash_var)
                        Case "txnid"
                            trnxnId = Request.Form(merc_hash_var)
                        Case "chkin"
                            checkInDate = Request.Form(merc_hash_var)
                        Case "chkout"
                            checkOutDate = Request.Form(merc_hash_var)
                        Case "adults"
                            adults = Request.Form(merc_hash_var)
                        Case "children"
                            childrens = Request.Form(merc_hash_var)
                        Case "roomtype"
                            roomType = Request.Form(merc_hash_var)
                        Case "noofrooms"
                            noOfRooms = Request.Form(merc_hash_var)
                        Case "phone"
                            mobile = Request.Form(merc_hash_var)
                        Case "city"
                            city = Request.Form(merc_hash_var)
                        Case "zipcode"
                            zip = Request.Form(merc_hash_var)
                        Case "address1"
                            custAddress = Request.Form(merc_hash_var)
                        Case "spclrequest"
                            spclRequest = Request.Form(merc_hash_var)
                    End Select
                Next
                'Response.Write(merc_hash_string)
                merc_hash = Generatehash512(merc_hash_string).ToLower()
                roomType = Session("RoomType").ToString
                custAddress = Session("address1")
                zip = Session("zipcode")
                checkInDate = Session("chkin")
                checkOutDate = Session("chkout")
                adults = Session("adults")
                childrens = Session("children")
                roomType = Session("RoomType")
                noOfRooms = Session("noofrooms")
                spclRequest = Session("spclrequest")
                roomId = Session("RoomId")
                mobile = Session("Mobile")
                city = Session("City")

                'If merc_hash <> Request.Form("hash") Then
                'Response.Redirect("~/BookRoom.aspx")
                'Response.Write("Hash value did not matched")
                'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry! Your Payment is not successfull!! Try Again');", True)
                'Response.Redirect("~/BookRoom.aspx")
                'Else
                order_id = Request.Form("txnid")

                custId = "cust" + (objBookRoom.getCustId()).ToString
                bookingId = "vil" + Date.Now.ToString("ddMMyyyy") + (objBookRoom.getBookingId()).ToString
                Dim custmodel As New customerdetails(custId, custName, custEmail, mobile, city, custAddress, zip, spclRequest, adults, _
                                                     childrens, noOfRooms, paidAmount, bookingId, roomId, checkInDate, checkOutDate)

                If objBookRoom.bookRoom(custmodel) Then
                    SendConfirmMail()
                    SendNoticeMail()
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Your Room has been booked successfully!!');", True)
                    Response.Redirect("~/Index.aspx")
                End If
                'Hash value did not matched
                'Response.Write("value matched")
                'Response.Redirect("~/Index.aspx")
                'End If
            Else


                ' osc_redirect(osc_href_link(FILENAME_CHECKOUT, 'payment' , 'SSL', null, null,true));

                'Response.Write("Hash value did not matched")
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Sorry! Your Payment is not successfull!! Try Again');", True)
                Response.Redirect("~/BookRoom.aspx")
            End If

        Catch ex As Exception

            Response.Write("<span style='color:red'>" & ex.Message & "</span>")
        End Try
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

    Public Function SendConfirmMail() As Boolean
        Try

            'Create the msg object to be sent
            Dim message As New MailMessage()

            'Add your email address to the recipients
            message.[To].Add("vilasicomforts.tumkur@gmail.com")
            message.Bcc.Add("geeksmagiccontact@gmail.com")

            'Configure the address we are sending the mail from
            Dim address As New MailAddress("no-reply@vilasicomforts.com")
            message.From = address
            message.Subject = "AutoReply: Your Room Booking Confirmation for Booking Id:" + bookingId
            Dim mailBody As String = String.Empty
            Dim reader As StreamReader = New StreamReader(Server.MapPath("~/ConfirmationMail.html"))
            mailBody = reader.ReadToEnd
            mailBody = mailBody.Replace("{BookingId}", bookingId)
            mailBody = mailBody.Replace("{CustName}", custName)
            mailBody = mailBody.Replace("{Email}", custEmail)
            mailBody = mailBody.Replace("{Mobile}", mobile)
            mailBody = mailBody.Replace("{City}", city)
            mailBody = mailBody.Replace("{Address}", custAddress)
            mailBody = mailBody.Replace("{NoOfRooms}", noOfRooms)
            mailBody = mailBody.Replace("{RoomNumber}", roomId)
            mailBody = mailBody.Replace("{CheckIn}", checkInDate)
            mailBody = mailBody.Replace("{CheckOut}", checkOutDate)
            mailBody = mailBody.Replace("{Adults}", adults)
            mailBody = mailBody.Replace("{Children}", childrens)
            mailBody = mailBody.Replace("{TypeOfRoom}", roomType)
            mailBody = mailBody.Replace("{AmountPaid}", paidAmount)
            message.Body = mailBody
            message.IsBodyHtml = True

            'Configure an SmtpClient to send the mail. 
            Dim client As New SmtpClient()
            client.Host = "smtpout.asia.secureserver.net"
            client.Port = 25

            'Setup credentials to login to our sender email address ("UserName", "Password")
            Dim credentials As New NetworkCredential("noreply@vilasicomforts.com", "vilasicomforts.com")
            client.UseDefaultCredentials = True
            client.Credentials = credentials

            'Send the msg
            client.Send(message)


            Return True
        Catch ex As Exception

            Return False
        End Try
    End Function

    Public Function SendNoticeMail() As Boolean
        Try

            'Create the msg object to be sent
            Dim message As New MailMessage()

            'Add your email address to the recipients
            message.[To].Add(custEmail)

            'Configure the address we are sending the mail from
            Dim address As New MailAddress("no-reply@vilasicomforts.com")
            message.From = address
            message.Subject = "AutoReply: Your Room Booking Confirmation for Booking Id:" + bookingId
            Dim mailBody As String = String.Empty
            Dim reader As StreamReader = New StreamReader(Server.MapPath("~/ConfirmationMail.html"))
            mailBody = reader.ReadToEnd
            mailBody = mailBody.Replace("{BookingId}", bookingId)
            mailBody = mailBody.Replace("{CustName}", custName)
            mailBody = mailBody.Replace("{Email}", custEmail)
            mailBody = mailBody.Replace("{Mobile}", mobile)
            mailBody = mailBody.Replace("{City}", city)
            mailBody = mailBody.Replace("{Address}", custAddress)
            mailBody = mailBody.Replace("{NoOfRooms}", noOfRooms)
            mailBody = mailBody.Replace("{RoomNumber}", roomId)
            mailBody = mailBody.Replace("{CheckIn}", checkInDate)
            mailBody = mailBody.Replace("{CheckOut}", checkOutDate)
            mailBody = mailBody.Replace("{Adults}", adults)
            mailBody = mailBody.Replace("{Children}", childrens)
            mailBody = mailBody.Replace("{TypeOfRoom}", roomType)
            mailBody = mailBody.Replace("{AmountPaid}", paidAmount)
            message.Body = mailBody
            message.IsBodyHtml = True

            'Configure an SmtpClient to send the mail. 
            Dim client As New SmtpClient()
            client.Host = "smtpout.asia.secureserver.net"
            client.Port = 25

            'Setup credentials to login to our sender email address ("UserName", "Password")
            Dim credentials As New NetworkCredential("noreply@vilasicomforts.com", "vilasicomforts.com")
            client.UseDefaultCredentials = True
            client.Credentials = credentials

            'Send the msg
            client.Send(message)


            Return True
        Catch ex As Exception

            Return False
        End Try
    End Function


End Class