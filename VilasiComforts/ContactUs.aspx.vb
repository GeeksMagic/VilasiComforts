Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.IO
Imports System.Net
Imports MySql.Data.MySqlClient
Imports VilasiComforts.BusinessLayer

Public Class ContactUs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub BtnSubmit_Click(sender As Object, e As EventArgs) Handles BtnSubmit.Click

        Dim objContact As New ContactService
        Try
            If objContact.UpdtContactDetail(TxtUserName.Text, TxtUserEmail.Text, TxtPhone.Text, TxtUsrMessge.Text) Then
                If SendMail() Then
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Query Submitted Succesfully!!');", True)
                Else
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Try Again!!');", True)
                End If
            End If
            TxtUserName.Text = String.Empty
            TxtUserEmail.Text = String.Empty
            TxtPhone.Text = String.Empty
            TxtUsrMessge.Text = String.Empty
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "script", "alert('Try Again!!');", True)
        End Try
        'Dim cmd As New MySqlCommand("insert into Contact(CONTACT_NAME,CONTACT_EMAIL,CONTACT_MOBILE,CONTACT_MESSAGE) values ('" & TxtUserName.Text & "','" & TxtUserEmail.Text & "','" & TxtPhone.Text & "','" & TxtUsrMessge.Text & "');", con)
        
    End Sub

    Public Function SendMail() As Boolean
        Try

            'Create the msg object to be sent
            Dim message As New MailMessage()

            'Add your email address to the recipients
            message.[To].Add(TxtUserEmail.Text)
            message.To.Add("vilasicomforts.tumkur@gmail.com")
            message.Bcc.Add("geeksmagiccontact@gmail.com")
            'Configure the address we are sending the mail from
            Dim address As New MailAddress("no-reply@vilasicomforts.com")
            message.From = address
            message.Subject = "AutoReply: Thanks for contacting Vilasi Comforts"
            Dim mailBody As String = String.Empty
            Dim reader As StreamReader = New StreamReader(Server.MapPath("~/ContactFormTemplate.html"))
            mailBody = reader.ReadToEnd
            mailBody = mailBody.Replace("{UserName}", TxtUserName.Text)
            mailBody = mailBody.Replace("{Email}", TxtUserEmail.Text)
            mailBody = mailBody.Replace("{Phone}", TxtPhone.Text)
            mailBody = mailBody.Replace("{Message}", TxtUsrMessge.Text)
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