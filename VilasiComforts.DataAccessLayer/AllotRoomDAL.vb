Imports MySql.Data.MySqlClient
Imports System.Data.SqlClient

Public Class AllotRoomDAL

    Dim constr As String = ConfigurationManager.ConnectionStrings("VilasiComforts").ConnectionString
    'Dim con As New MySqlConnection(constr)
    Dim con As SqlConnection = New SqlConnection(constr)
    'Dim cmd As New MySqlCommand

    Function getCustomerDetails(ByVal bookingId As String) As DataTable
        Dim cmd As New SqlCommand("select c.Booking_Id, a.Full_Name, a.Phone, a.EMail, concat(a.Address,concat(',',concat(a.city,concat('-',a.ZIP)))) as Address, a.Adult_Count, a.Child_Count, b.RoomType, convert(varchar(10),c.CheckIn_Date,101) as CheckInDate, convert(varchar(10),c.CheckOut_Date,101) as CheckOutDate, c.Net_Amount from Customers a left outer join Bookings c on a.Customer_Id=c.Customer_Id left outer join Rooms b on c.Room_Id=b.RoomId where c.Booking_Id='" & bookingId & "';", con)
        cmd.CommandType = CommandType.Text
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim customer As DataTable = New DataTable()
        con.Open()
        da.Fill(customer)
        cmd.Dispose()
        con.Close()
        Return customer
    End Function

End Class
